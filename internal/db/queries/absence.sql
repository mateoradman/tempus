-- name: CreateAbsence :one
INSERT INTO absences (
user_id, start_time, end_time, reason, paid, approved_by_id
) VALUES (
$1,
$2,
$3,
$4,
$5,
$6
)
RETURNING *;

-- name: GetAbsence :one
SELECT * 
FROM absences
WHERE id = $1
LIMIT 1;

-- name: ListAbsences :many
SELECT *
FROM absences
ORDER BY id
LIMIT $1
OFFSET $2;

-- name: ListUserAbsences :many
SELECT *
FROM absences
WHERE user_id = $1
ORDER BY id
LIMIT $2
OFFSET $3;

-- name: UpdateAbsence :one
UPDATE absences
SET 
user_id = $2, 
reason = $3, 
paid = $4, 
start_time = $5, 
end_time = $6, 
approved_by_id = $7
WHERE id = $1
RETURNING *;

-- name: DeleteAbsence :one
DELETE
FROM absences
WHERE id = $1
RETURNING *;