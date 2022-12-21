package main

import (
	"fmt"
	"log"
	"strings"
	"sync"
	"time"

	"gorm.io/driver/postgres"
	"gorm.io/gorm"
	"gorm.io/gorm/clause"
	"gorm.io/gorm/logger"
)

type Team struct {
	ID   int64  `gorm:"column:id"`
	Name string `gorm:"column:name"`
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
		Logger: logger.Default.LogMode(logger.Info),
	})
	if err != nil {
		log.Fatal(err)
	}

	for i := 0; i < 20; i++ {
		now := time.Now()
		teamName := fmt.Sprintf("team%d", i)
		teamID := createTeam(teamName)
		fmt.Printf("team is created: %s\n", time.Since(now))
		teamIDs = append(teamIDs, teamID)
	}

	wg := &sync.WaitGroup{}
	wg.Add(2)
	go selectTeam(wg)
	go selectTeam(wg)
	wg.Wait()

	teams := []*Team{}

	err = db.Find(&teams).Error
	if err != nil {
		log.Fatal(err)
	}
	for _, t := range teams {
		fmt.Printf("%+v\n", t)
	}
}

func selectTeam(wg *sync.WaitGroup) {
	defer wg.Done()
	fmt.Println("start")
	startTime := time.Now()
	teams := make([]*Team, 0, 5)
	err := db.Transaction(func(tx *gorm.DB) error {
		fmt.Println("select for update")
		err := tx.Clauses(clause.Locking{Strength: "UPDATE"}).Limit(5).Find(&teams).Error
		if err != nil {
			return err
		}
		for i, t := range teams {
			fmt.Println(t)
			teams[i].Name = strings.Repeat(t.Name, 2)
		}
		fmt.Println("save")
		err = tx.Save(&teams).Error
		if err != nil {
			return err
		}
		time.Sleep(5 * time.Second)
		return nil
	})
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println("end:", time.Since(startTime))
}

func createTeam(teamName string) int64 {
	team := &Team{Name: teamName}
	err := db.Create(team).Error
	if err != nil {
		log.Fatal(err)
	}
	return team.ID
}
