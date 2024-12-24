main :-
    Friends = [friend(alex, Dept_Alex, Lang_Alex, Proj_Alex),
               friend(ben, Dept_Ben, Lang_Ben, Proj_Ben),
               friend(carla, Dept_Carla, Lang_Carla, Proj_Carla),
               friend(dana, Dept_Dana, Lang_Dana, Proj_Dana)],
    
    Departments = [research, development, design, testing],
    Languages = [python, java, 'c++', javascript],
    Projects = [ai, web, embedded, data],
    
    maplist(arg(2), Friends, Departments_Assigns),
    maplist(arg(3), Friends, Languages_Assigns),
    maplist(arg(4), Friends, Projects_Assigns),
    
    permutation(Departments, Departments_Assigns),
    permutation(Languages, Languages_Assigns),
    permutation(Projects, Projects_Assigns),
    
    member(friend(Friend_Ai, Dept_Ai, _, ai), Friends),
    Friend_Ai \= dana,
    Dept_Ai \= research,
    
    member(friend(alex, Dept_Alex, Lang_Alex, Proj_Alex), Friends),
    Dept_Alex \= development,
    Lang_Alex \= 'c++',
    
    member(friend(_, testing, python, _), Friends),
    
    member(friend(ben, Dept_Ben, Lang_Ben, web), Friends),
    Dept_Ben \= testing,
    
    member(friend(_, design, java, _), Friends),
    
    member(friend(carla, Dept_Carla, Lang_Carla, Proj_Carla), Friends),
    Proj_Carla \= embedded,
    Dept_Carla \= development,
    
    member(friend(dana, Dept_Dana, Lang_Dana, Proj_Dana), Friends),
    Lang_Dana \= java,
    (Dept_Dana = research; Dept_Dana = testing),
    
    member(friend(_, research, Lang_Data, data), Friends),
    Lang_Data \= javascript,
    
    member(friend(alex, Dept_Alex, Lang_Alex, Proj_Alex), Friends),
    write('Alex = ['), write(Dept_Alex), write(', '), write(Lang_Alex), write(', '), write(Proj_Alex), write(']'), nl,
    
    member(friend(ben, Dept_Ben, Lang_Ben, Proj_Ben), Friends),
    write('Ben = ['), write(Dept_Ben), write(', '), write(Lang_Ben), write(', '), write(Proj_Ben), write(']'), nl,
    
    member(friend(carla, Dept_Carla, Lang_Carla, Proj_Carla), Friends),
    write('Carla = ['), write(Dept_Carla), write(', '), write(Lang_Carla), write(', '), write(Proj_Carla), write(']'), nl,
    
    member(friend(dana, Dept_Dana, Lang_Dana, Proj_Dana), Friends),
    write('Dana = ['), write(Dept_Dana), write(', '), write(Lang_Dana), write(', '), write(Proj_Dana), write(']'), nl.
    
?-main.
