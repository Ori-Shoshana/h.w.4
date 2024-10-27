% 1. Sum of numbers from 1 to N
scum(1, 1).
scum(N, Res) :- 
    N > 1,
    N1 is N - 1,
    scum(N1, Res1),
    Res is Res1 + N.

% 2. Sum of digits of a number
sumDigits(0, 0).
sumDigits(Num, Sum) :- 
    Num > 0,
    Digit is Num mod 10,
    Num1 is Num // 10,
    sumDigits(Num1, Sum1),
    Sum is Sum1 + Digit.

% 3. Split a number into its digits in the correct order
split(N, Res) :- 
    N > 0, 
    split_helper(N, [], Res).

split_helper(0, Acc, Acc).  % When N is 0, the accumulated digits are the result.
split_helper(N, Acc, Res) :- 
    N > 0,
    Digit is N mod 10,  % Get the last digit.
    N1 is N // 10,  % Remove the last digit.
    split_helper(N1, [Digit|Acc], Res).  % Accumulate the digit in reverse order.

% 4. Create a number from a list of digits
create([], 0).
create(List, N) :- 
    create_from_list(List, N, 0).

create_from_list([], N, N).  % An empty list corresponds to the number in N.
create_from_list([H|T], N, Acc) :- 
    NewAcc is Acc * 10 + H,
    create_from_list(T, N, NewAcc).

% 5. Reverse the digits of a number
reverse_digits(N, Reversed) :- 
    N > 0,  % Ensure that N is a positive number
    split(N, Digits),  % Split the number into its digits
    reverse(Digits, ReversedDigits),  % Reverse the list of digits
    create(ReversedDigits, Reversed).  % Create the number from the reversed list of digits

% 6. Intersection of two lists
intersection([], _, []).
intersection([H|T], L2, [H|Z]) :- 
    member(H, L2),
    intersection(T, L2, Z).
intersection([H|T], L2, Z) :- 
    \+ member(H, L2),
    intersection(T, L2, Z).

% 7. List minus operation
minus([], _, []).
minus([H|T], L2, [H|Z]) :- 
    \+ member(H, L2),
    minus(T, L2, Z).
minus([H|T], L2, Z) :- 
    member(H, L2),
    minus(T, L2, Z).
