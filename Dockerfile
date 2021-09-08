FROM openjdk:8
COPY helloworld.java .
RUN javac helloworld.java
CMD ["java","helloworld"]


