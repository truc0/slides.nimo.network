dest = dist

all : lesson-01 lesson-02 lesson-03 lesson-04 lesson-05 lesson-07 lesson-08 lesson-09

dist/lesson-01 : lesson-01.md
	yarn build lesson-01.md --out $(dest)/lesson-01/ --base /lesson-01/ 

dist/lesson-02 : lesson-02.md
	yarn build lesson-02.md --out $(dest)/lesson-02/ --base /lesson-02/ 
	
dist/lesson-03 : lesson-03.md
	yarn build lesson-03.md --out $(dest)/lesson-03/ --base /lesson-03/ 

dist/lesson-04 : lesson-04.md
	yarn build lesson-04.md --out $(dest)/lesson-04/ --base /lesson-04/ 

dist/lesson-05 : lesson-05.md
	yarn build lesson-05.md --out $(dest)/lesson-05/ --base /lesson-05/ 

dist/lesson-07 : lesson-07.md
	yarn build lesson-07.md --out $(dest)/lesson-07/ --base /lesson-07/ 

dist/lesson-08 : lesson-08.md
	yarn build lesson-08.md --out $(dest)/lesson-08/ --base /lesson-08/ 

dist/lesson-09 : lesson-09.md
	yarn build lesson-09.md --out $(dest)/lesson-09/ --base /lesson-09/ 


# alias
lesson-01 : dist/lesson-01
lesson-02 : dist/lesson-02
lesson-03 : dist/lesson-03
lesson-04 : dist/lesson-04
lesson-05 : dist/lesson-05
lesson-07 : dist/lesson-07
lesson-08 : dist/lesson-08
lesson-09 : dist/lesson-09

.PHONY : clean
clean :
	rm -rf $(dest)
