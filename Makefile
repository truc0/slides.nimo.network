all : lesson-01 lesson-02

lesson-01 : lesson-01.md
	yarn build lesson-01.md --out dist/lesson-01/ --base /lesson-01/ 

lesson-02 : lesson-02.md
	yarn build lesson-02.md --out dist/lesson-02/ --base /lesson-02/ 
