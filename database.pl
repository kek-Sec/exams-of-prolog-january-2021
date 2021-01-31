:- consult('kb.pl').

collect_result :-
        write('1.name of univerity'),nl,
        write('2.university'),nl,
        write('3.user details'),nl,
        write('4.ages'),nl,
        write('your choice:'),
        
        read(Choice),

        choices(Choice).

choices(1) :- find_university_staff.
choices(2) :- univerity.
choices(3) :- user_info.
choices(4) :- user_ages.

choices(_) :- abort.

find_university_staff :-
                        write('enter the name of university'),nl,
                        write('etc hmu :'),

                        read(University),

                        write('academic staff or student:'),
                        read(Ability),
                        
                        print_university(University,Ability).

print_university(X,Y) :- bagof( (Name,Lesson), kb(Name,_,_,Y,Lesson,X),L), write(L),nl,fail.

univerity :- 
            write('enter a name of university:'),
            read(University),

            write('Lesson:'),
            read(Lesson),

            write('enter student or academicStaff:'),
            read(Ability),

            print_users(University,Lesson,Ability).

print_users(University,Lesson,Ability) :- setof(Y,kb(Y,_,_,Ability,Lesson,University),L), write(L),fail.

user_info :-
            write('enter lesson or academicStaff'),nl,
            read(X),

            user_print(X).

user_print(X) :- bagof((Name,Gender,Age),kb(Name,Gender,Age,X,_,_),L),write(L),fail.

user_print(X) :- bagof((Name,Gender,Age),kb(Name,Gender,Age,_,X,_),L),write(L),fail.

user_ages :- 
            write('enter a name of university:'),
            read(University),

            write('enter minimum age:'),
            read(N1),

            write('enter maxinum age:'),
            read(N2),

            write('academic staff or student:'),
            read(Ability),

            print_user_by_age(University,N1,N2,Ability).

print_user_by_age(University,N1,N2,Ability) :- bagof((Name),(kb(Name,_,Age,Ability,_,University),(Age >=N1, Age=<N2)),L),write(L),nl ,fail.

%update 
update_KB :-
    write('1.change value'),nl,
    write('2.add a value'),nl,
    write('3.delete value'),nl,

    read(X),

    ch(X),

    save_results,
    update_KB.

ch(1) :- change_record_KB.

ch(2) :- create_record_KB.

ch(3) :- delete_record_KB.

ch(_) :- abort.


change_record_KB :-

                write('enter a name you want to change'),
                read(Name),nl,

                print_user(Name),

                retract(kb(Name,_,_,_,_,_)),

                write('enter new value of gender'),
                read(Gender),nl,

                write('enter new value of age'),
                read(Age),nl,

                write('student or academic staff'),
                read(Ability),nl,

                write('enter new value of lesson'),
                read(Lesson),nl,

                write('enter new value of the university'),
                read(University),nl,

                %update user
                assertz(kb(Name,Gender,Age,Ability,Lesson,University)).

create_record_KB :-
                write('enter user name:'),
                read(Name),nl,

                write('enter gender'),
                read(Gender),nl,

                write('enter age'),
                read(Age),nl,

                write('student or academic staff'),
                read(Ability),nl,

                write('enter lesson'),
                read(Lesson),nl,

                write('enter the university'),
                read(University),nl,

                asserta(kb(Name,Gender,Age,Ability,Lesson,University)).

print_user(X) :- kb(X,Gender,Age,Ability,Lesson,University), 
                
                 write(Gender),nl,

                 write(Age),nl,

                 write(Ability),nl,

                 write(Lesson),nl,

                 write(University),nl.

delete_record_KB :-
                %put the id to delete
                write('enter a name to delete:'),
                read(Name),

                retract(kb(Name,_,_,_,_,_)).

save_results :- 
            tell('new_kb.pl'),
            listing(kb),
            told.          