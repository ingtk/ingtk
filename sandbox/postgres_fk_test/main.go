package main

import (
	"fmt"
	"log"
	"math/rand"
	"sync"
	"time"

	"github.com/mattn/go-gimei"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
)

type Team struct {
	ID   int64  `gorm:"column:id"`
	Name string `gorm:"column:name"`
}

type User struct {
	ID     int64  `gorm:"column:id"`
	Name   string `gorm:"column:name"`
	Age    int    `gorm:"column:age"`
	TeamID int64  `gorm:"column:team_id"`
}

var db *gorm.DB

const teamNum = 100

var teamIDs = make([]int64, 0, teamNum)

func main() {
	var err error
	dsn := "user=testu password=testpw dbname=testdb host=db port=5432 sslmode=disable"
	// dsn := ""
	db, err = gorm.Open(postgres.Open(dsn), &gorm.Config{
		// PrepareStmt:            true,
		// SkipDefaultTransaction: true,
		NowFunc: func() time.Time {
			return time.Now().Truncate(time.Second)
		},
		Logger: logger.Default.LogMode(logger.Error),
	})
	if err != nil {
		log.Fatal(err)
	}

	for i := 0; i < teamNum; i++ {
		now := time.Now()
		teamName := fmt.Sprintf("team%d", i)
		teamID := createTeam(teamName)
		createUsers(teamID)
		fmt.Printf("team is created: %s\n", time.Since(now))
		teamIDs = append(teamIDs, teamID)
	}

	rand.Shuffle(len(teamIDs), func(i, j int) {
		teamIDs[i], teamIDs[j] = teamIDs[j], teamIDs[i]
	})

	for i := 0; i < 5; i++ {
		deleteUsers(teamIDs[i])
	}

	now := time.Now()
	wg := &sync.WaitGroup{}
	for i := 0; i < 5; i++ {
		wg.Add(1)
		go (func(teamID int64) {
			defer wg.Done()
			deleteTeam(teamID)
		})(teamIDs[i])
	}
	wg.Wait()
	fmt.Printf("5チーム削除終了: %s\n", time.Since(now))
}

func createTeam(teamName string) int64 {
	team := &Team{Name: teamName}
	err := db.Create(team).Error
	if err != nil {
		log.Fatal(err)
	}
	return team.ID
}

func createUsers(teamID int64) {
	const max = 500000
	users := make([]*User, 0, max)
	for i := 0; i < max; i++ {
		name := gimei.NewName()
		age := rand.Intn(80)
		user := &User{Name: name.Kanji(), Age: age, TeamID: teamID}
		users = append(users, user)
	}
	err := db.CreateInBatches(users, 1000).Error
	if err != nil {
		log.Fatal(err)
	}
}

func deleteUsers(teamID int64) {
	err := db.Where("team_id = ?", teamID).Delete(&User{}).Error
	if err != nil {
		log.Fatal(err)
	}
}

func deleteTeam(teamID int64) {
	err := db.Where("id = ?", teamID).Delete(&Team{}).Error
	if err != nil {
		log.Fatal(err)
	}
}
