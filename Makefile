all : lesson-01 lesson-02 lesson-03 lesson-04 lesson-05

dist/lesson-01 : lesson-01.md
	yarn build lesson-01.md --out dist/lesson-01/ --base /lesson-01/ 

dist/lesson-02 : lesson-02.md
	yarn build lesson-02.md --out dist/lesson-02/ --base /lesson-02/ 
	
dist/lesson-03 : lesson-03.md
	yarn build lesson-03.md --out dist/lesson-03/ --base /lesson-03/ 

dist/lesson-04 : lesson-04.md
	yarn build lesson-04.md --out dist/lesson-04/ --base /lesson-04/ 

dist/lesson-05 : lesson-05.md
	yarn build lesson-05.md --out dist/lesson-05/ --base /lesson-05/ 

# alias
lesson-01 : dist/lesson-01
lesson-02 : dist/lesson-02
lesson-03 : dist/lesson-03
lesson-04 : dist/lesson-04
lesson-05 : dist/lesson-05
