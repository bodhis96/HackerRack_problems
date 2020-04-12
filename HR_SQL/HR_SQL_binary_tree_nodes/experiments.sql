-- *** EXPERIEMENTS ***

-- START :: enlist all the nodes
select N from BST
order by N;
-- END :: enlist all the nodes

-- START ::  enlist all the parent nodes
select P, N from BST
order by P, N;
-- END ::  enlist all the parent nodes


-- categorize as 'Inner' and 'Root'
SELECT
	N,
	case
		when P is null then 'Root'
		else 'Inner'
	end NODE_TYPE
FROM
	BST
ORDER BY
	N;
-- 1	Inner
-- 2	Inner
-- 3	Inner
-- 3	Inner
-- 4	Inner
-- 5	Inner
-- 6	Inner
-- 7	Inner
-- 8	Inner
-- 9	Inner
-- 10	Inner
-- 11	Inner
-- 12	Inner
-- 13	Inner
-- 14	Inner
-- 15	Root

-- categorize as 'Inner' and 'Leaf'
SELECT
	N,
	case
		when N in ( select P from BST ) then 'Inner'
		else 'Leaf'
	end NODE_TYPE
FROM
	BST
ORDER BY
	N;
-- 1	Leaf
-- 2	Inner
-- 3	Leaf
-- 3	Leaf
-- 4	Inner
-- 5	Leaf
-- 6	Inner
-- 7	Leaf
-- 8	Leaf
-- 9	Inner
-- 10	Leaf
-- 11	Inner
-- 12	Leaf
-- 13	Inner
-- 14	Leaf
-- 15	Inner 
 


 
 