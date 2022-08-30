#Movie ratings project Visualization with GGplot2

setwd("C:\\ProgramData\\Microsoft\\Windows\\Start Menu\\Programs\\
      RStudio")
getwd

Movies<-read.csv("C:\\Users\\chuka\\Downloads\\Movie_Ratings.csv")
Movies

head(Movies)
colnames(Movies)<- c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions",
                     "Year")

tail(Movies)
str(Movies)
levels(Movies$Genre)

?factor

factor(Movies$Year)

factor(Movies[Movies$Genre],,drop=F)

Movies$Year<- factor(Movies$Year)
summary(Movies)
head(Movies)

str(Movies)

#

?aes

ggplot (data=Movies, aes(x=CriticRating, y=AudienceRating))

#geometry

ggplot (data=Movies, aes(x=CriticRating, y=AudienceRating))+ 
  geom_point()
#add colour

ggplot (data=Movies, aes(x=CriticRating, y=AudienceRating, colour=Genre))+
geom_point()
  

#add size
ggplot (data=Movies, aes(x=CriticRating, y=AudienceRating, colour=Genre
                         , size=BudgetMillions))+ 
  geom_point()

#point
p<-ggplot (data=Movies, aes(x=CriticRating, y=AudienceRating, colour=Genre
                         , size=BudgetMillions))

p + geom_point()

#lines
p+geom_line()

#multiple layers
p + geom_line() + geom_point()

p + geom_point()+ geom_line()

#overriding aesthetics

q <-ggplot (data=Movies, aes(x=CriticRating, y=AudienceRating, colour=Genre
                            , size=BudgetMillions))+geom_point()
q
#add geom layer
#ex1
q +geom_point(aes(size=CriticRating))

#ex2
q +geom_point(aes(colour=BudgetMillions))

q + geom_point()

#ex3
q + geom_point(aes(x=BudgetMillions))
?xlab

q + geom_point(aes(x=BudgetMillions))+ labs(x="Budget Millions")

q + geom_line(size=1)+geom_point()

#mapping vs setting

r <- ggplot(data=Movies, aes(x=CriticRating, y=AudienceRating))
r
r + geom_point()

?geom_point()

#adding colour
#1. mapping
head(Movies)

r + geom_point(aes(colour=Genre))

#2. setting
r + geom_point(colour="DarkGreen")
#error
#r + geom_point(aes(colour="DarkGreen"))

#1. mapping
r + geom_point(aes(size=BudgetMillions))

#2. setting
r + geom_point (size=1)
#error
r + geom_point(aes(size=10))

###histogram

h <- ggplot(data=Movies, aes(x=BudgetMillions))
h + geom_histogram(binwidth = 10)

?aes

#add colour
h + geom_histogram(binwidth = 10, aes(fill=Genre))

#add border
h + geom_histogram(binwidth = 10, aes(fill=Genre), colour='black')
h + geom_histogram(binwidth = 10, aes(colour()))

###to create a density map

h + geom_density(aes(fill=Genre))
h + geom_density(aes(fill=Genre), position = "stack")

?aes

#starting layer tips

l<- ggplot(data=Movies, aes(x=AudienceRating))
l + geom_histogram(binwidth = 10, fill= 'white', colour= 'Blue')
?geom_bar
#method 2
l<- ggplot(data=Movies)
l + geom_histogram(binwidth = 10,aes(x=CriticRating),
                   fill= 'darkred', colour= 'black')
?ggplot


u <- ggplot (data=Movies, aes(x=CriticRating, y=AudienceRating,
                              colour=Genre)

u + geom_point()
u + geom_point()+ geom_smooth()
u + geom_point() + geom_smooth(fill=NA)


#boxplots
u <- ggplot (data=Movies, aes(x=Genre, y=AudienceRating,
                              colour=Genre))
u + geom_boxplot()
u + geom_boxplot(size=0.8)

#add point/scatter
u + geom_boxplot(size=0.5)+geom_point(size=0.3)

#tip/hack=jitter
u + geom_boxplot(size=0.5)+geom_jitter(size=0.5)

#or, using another way by including the scatter and the increasing the 
#transparency of the boxplot
u + geom_jitter(size=0.5)+ geom_boxplot(size=0.5, alpha=0.5)


#challange
#first method
u <- ggplot (data=Movies)
u + geom_boxplot(size=0.5, alpha=0.5, aes(x=Genre,y=CriticRating, colour=Genre))+ 
  geom_jitter(size=0.5)

u <- ggplot(data=Movies)

u +geom_jitter()+ geom_boxplot(size=0.5, alpha=0.5, aes(x=Genre,y=CriticRating,colour= Genre))



#second method
u <- ggplot (data=Movies, aes(x=Genre, y=CriticRating,
                              colour=Genre))
     
u + geom_jitter(size=0.5)+ geom_boxplot(size=0.5, alpha=0.5)

####using facets
po <- ggplot(data=Movies,aes(x=BudgetMillions))
po + geom_histogram(binwidth = 10, aes(fill= Genre),
                    colour= 'black')+ facet_grid(Genre~., scales='free_x')

?facet_grid()
#facets+scatter
ip <- ggplot(data=Movies,aes(x=CriticRating, y=AudienceRating
                             , colour= Genre))

ip + geom_point(size=1)+
  facet_grid(Year~.)

ip + geom_point(aes(size=BudgetMillions))+
  facet_grid(Genre~Year)+ geom_smooth()+coord_cartesian(ylim=c(0,100))

?coord_cartesian

fill=NA
#coordinates
#limits
#zoom

kl<-ggplot(data=Movies, aes(x=CriticRating,y=AudienceRating,
           size=BudgetMillions,colour=Genre))
kl+geom_point()

kl+geom_point()+xlim(50,100)+ylim(50,100)

#it wont work always(especially with histogram)
nv<-ggplot(data=Movies, aes(x=BudgetMillions))
nv+geom_histogram(binwidth = 10,aes(fill= Genre),colour = 'black')

nv+geom_histogram(binwidth = 10,aes(fill= Genre),colour = 'black')+ylim(0,50)

#so we are going to apply the zoom function
nv+geom_histogram(binwidth = 10,aes(fill= Genre),
                  colour = 'black')+coord_cartesian(ylim = c(0,60))


#improve initial one
ip + geom_point(aes(size=BudgetMillions))+
  facet_grid(Genre~Year)+ geom_smooth()+coord_cartesian(ylim = c(0,100))


#Adding themes

oh <- ggplot(data=Movies, aes(x=BudgetMillions))
vb<-oh + geom_histogram(binwidth = 10, aes(fill=Genre), colour = 'Black')

vb

#axes labels

vb + 
  xlab("Money Axis") + 
  ylab("Number of Movies")

#label formatting
vb + 
  xlab("Money Axis") + 
  ylab("Number of Movies")+
  theme(axis.title.x = element_text(colour="DarkGreen", size=10),
        axis.title.y = element_text(colour="Red", size=10))

#tick mark formatting
vb + 
  xlab("Money Axis") + 
  ylab("Number of Movies")+
  theme(axis.title.x = element_text(colour="DarkGreen", size=10),
        axis.title.y = element_text(colour="Red", size=10),
        axis.text.x=element_text(size=10),
        axis.text.y=element_text(size=10))


?theme
#legend formatting
vb + 
  xlab("Money Axis") + 
  ylab("Number of Movies")+
  theme(axis.title.x = element_text(colour="black", size=10),
        axis.title.y = element_text(colour="black", size=10),
        axis.text.x=element_text(size=10),
        axis.text.y=element_text(size=10),
        legend.title=element_text(size=10),
        legend.text=element_text(size=10),
        legend.position=c(1,1),
        legend.justification=c(1,1))


?legend
#title
vb + 
  xlab("Money Axis")+ 
  ylab("Number of Movies")+ 
  ggtitle("Movie Budget Distribution")+
  theme(axis.title.x = element_text(colour="black", size=10),
        axis.title.y = element_text(colour="black", size=10),
        axis.text.x=element_text(size=10),
        axis.text.y=element_text(size=10),
        legend.title=element_text(size=10),
        legend.text=element_text(size=10),
        legend.position=c(1,1),
        legend.justification=c(1,1),
        plot.title=element_text(colour="black",
        size=12, hjust=0.5,family="Courier")) 

+ scale_x_discrete(limits=c("0", "350"))


?scale_x_discrete
?plot.title


l + geom_histogram(binwidth = 10, fill= 'white', colour= 'Blue')

nv+geom_histogram(binwidth = 10,aes(fill= Genre),colour = 'black')

nv+geom_histogram(binwidth = 10,aes(fill= Genre),colour = 'black')+ylim(0,50)

l<- ggplot(data=Movies, aes(x=AudienceRating))
l + geom_histogram(binwidth = 10, fill= 'white', colour= 'Blue')
?geom_bar
#method 2
l<- ggplot(data=Movies)
l + geom_histogram(binwidth = 10,aes(x=CriticRating),
                   fill= 'darkred', colour= 'black')