all : lesson-01

lesson-01 : lesson-01.md
	yarn build lesson-01.md --out dist/lesson-01/ --base /lesson-01/ 
