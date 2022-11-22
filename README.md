# Ada for Software Engineers (Second Edition with Ada 2005)

Springer, 2009. ISBN [978-1-84882-313-6](https://link.springer.com/book/10.1007/978-1-84882-314-3).

[Mordechai (Moti) Ben-Ari](https://www.weizmann.ac.il/sci-tea/benari/home)
	
Ada for Software Engineers teaches the language through relatively large case-studies such as a discrete event simulation. The presentation emphasizes the features for object-oriented and systems programming that were introduced in Ada 95, as well as features from Ada 2005. 

The directory `quizzes` contains source code that can help solve the quizzes.

The directory `programs` contains the source code of the case studies in the text. The list of programs follows.

1. The Language for a Complex World
                          
2. First Steps in Ada

        country1  - make of car to country (case statement)   
        country2  - make of car to country (membership test)   

3. Subprograms
          
        country3   - make of car to country (function)

4. Arrays

        country4   - make of car to country (array)     
        justify    - justify text    
        palin      - palindrome    
        swap       - swapping halves of an array    

5. Elementary Data Structures

        progpqa    - priority queue implemented as an array    
        progpqt    - priority queue implemented as a tree    

6. Packages and Abstract Data Types

        pqa        - limited private priority queue (array implementation)    
        pqav*      - priority queue array implementation (4 versions)    
        pqt        - limited private priority queue (tree implementation)    
        pqtv*      - priority queue tree implementation (3 versions)    
        quat       - quaternions    

7. Type Extension and Inheritance

        rocket     - rocket simulation    
        rocketc    - rocket simulation without child packages    

8. Type Extension and Inheritance

        func       - extended example of dispatching on a function    
        rocketf    - rocket simulation with dispatching on a function    
        rocketp    - rocket simulation with distinguished receiver syntax    

9. Generics

        genchild   - generic child of generic package    
        legal      - legality rules in contract model    
        pqgen      - generic priority queue    
        rocket*    - generic rocket simulation (two versions)    
        rocketq    - rocket simulation with generic priority queue    
        sort       - generic selection sort    
        sortacc    - generic selection sort with access types    

10. Exceptions and Run-Time Checks

        assert     - assertions    
        info       - exception information    
        propagate* - propagating an exception (two versions)    
        reraise    - reraising an exception    
        save       - saving and retrieving exception occurrences    

11. Composite Types

        curr       - currency symbols (wide characters)    
        dot2dot    - dot to dot conversion (string processing)    
        message    - message conversion (variant records)    
        rep        - change of representation (derived types)    
        rocketd    - rocket simulation with inherited discriminants    

12. Access Types

        callb      - callbacks (general access types)    
        callba     - callbacks (with anonymous access type)    
        level      - accessibility levels    
        ndfa       - nondeterministic finite automata                   
        ndfa95     - nondeterministic finite automata (Ada 95 version)    
        pqtaccess  - priority queue (with anonymous access type)    
        pqtct      - priority queue (with controlled type)    
        ragged     - ragged arrays    
        raggeda    - ragged arrays (with anonymous access type)    
        rocketad   - rocket simulation with access discriminants    

13. Numeric Types                        

        check      - checksum (modular types)    
        complex    - complex vectors (generic package parameters)    
        convert    - currency conversion (decimal fixed types)    
        diff       - differential equation (floating point types)    
        pref       - preference for root types    
        temp       - ordinary fixed point types    

14. Input-Output

        rocketfac  - rocket simulation with generic constructor    
        rocketst   - rocket simulation with streams    

15. Program Structure

        elab       - elaboration order    
        over       - overloading    
        question   - question on operator visibility    
        renam      - renaming as body    
        subunit    - subunits    
        table      - package specification needing a body    

16. Containers

        query      - query element    
        rocketcon  - rocket simulation with containers    

17. Interfaces and Multiple Inheritance

        inter      - rocket simulation with displayable interface    
        mixin1     - mixin inheritance, generic private type    
        mixin2     - mixin inheritance, generic derived type    
        protectedpc- producer-consumer, protected interface    
        store      - heterogeneous store with storable interface    
        synchpc    - producer-consumer, synchronous interface    
        taskpc     - producer-consumer, task interface    

18. Concurrency

        ceot       - CEO problem, with terminate    
        protect    - producer-consumer, protected object    
        taskpc     - producer-consumer, task    

19. Concurrency (Continued)

        async      - asynchronous transfer of control    
        ceod       - CEO problem, with delay    
        cond       - conditional entry call    
        config     - access discriminants for configuration    
        disptask   - "dispatching" on tasks    
        period     - periodic task    
        rockett    - rocket simulation with multitasking    

20. Systems Programming

        id         - task identification and attributes    
        term       - detecting task termination    
        union      - unchecked unions    

21. Real-Time Systems

        event      - timing events    
        raven1     - Ravenscar profile, periodic task    
        raven2     - Ravenscar profile, global data    
        raven3     - Ravenscar profile, suspension object    
        raven4     - Ravenscar profile, protected object    
        raven5     - Ravenscar profile, protected object, synchronization    
        raven6     - Ravenscar profile, violates restriction    
        raven7     - Ravenscar profile, multiple suspension objects    
        exectime   - execution time

22. Distributed and High Integrity Systems

        dist       - rocket simulation with distributed dispatching    
