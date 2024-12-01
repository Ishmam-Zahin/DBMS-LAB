SELECT no_of_copies
FROM book_copies
WHERE book_id = (
	SELECT book_id
    FROM book
    WHERE title = 'DBMS'
) AND branch_id = (
	SELECT branch_id
    FROM library_branch
    WHERE branch_name = 'CSE Seminar Library'
);

SELECT no_of_copies, branch_name
FROM book_copies NATURAL JOIN library_branch
WHERE book_id = (
	SELECT book_id
    FROM book
    WHERE title = 'DBMS'
);

SELECT borrower.name
FROM borrower
LEFT JOIN book_loan ON borrower.card_no = book_loan.card_no
WHERE book_loan.book_id IS NULL;

SELECT title, name, borrower.address
FROM book_loan NATURAL JOIN borrower NATURAL JOIN book
WHERE branch_id = (
	SELECT branch_id
    FROM library_branch
    WHERE branch_name = 'CSE Seminar Library'
) AND due_date = CURRENT_DATE;

SELECT COUNT(book_id) as no_of_borrowed_book, branch_name
FROM book_loan NATURAL JOIN library_branch
GROUP BY branch_id;

SELECT COUNT(book_id) as no_of_borrowed_books, name, address, phone
FROM book_loan NATURAL JOIN borrower
GROUP BY card_no
HAVING COUNT(book_id) > 2;

SELECT title, no_of_copies
FROM book NATURAL JOIN book_author NATURAL JOIN book_copies
WHERE author_name = 'Ivan BayRoss' and branch_id = (
	SELECT branch_id
    FROM library_branch
    WHERE branch_name = 'RU Central Library'
);