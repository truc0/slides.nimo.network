all : lesson-01

lesson-01 : lesson-01.md
	yarn build lesson-01.md --out dist/lession-01/ --base /lession-01/ 
