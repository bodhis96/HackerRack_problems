-- *** FINAL ANSWER ***
SELECT
	N,
	case
		when P is null then 'Root'
		else case
			when N in ( select P from BST ) then 'Inner'
			else 'Leaf'
		end 
	end
FROM
	BST
ORDER BY
	N;