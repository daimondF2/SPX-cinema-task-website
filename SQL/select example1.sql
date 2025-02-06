SELECT
m.memberId,
m.username,
m.firstName,
m.lastName,
m.street
FROM members AS m
WHERE
firstName = "Joe"
AND lastName= "Jonaz"
ORDER BY lastName, firstName DESC