
SELECT * FROM picture
LEFT JOIN user ON picture.author_id=user.id
LEFT JOIN like_user_picture ON like_user_picture.picture_id=picture.id
WHERE visible=true;

SELECT * FROM picture
LEFT JOIN user ON picture.author_id=user.id
WHERE id=1;

SELECT * FROM comment
LEFT JOIN user ON comment.author_id=user.id
WHERE picture_id=1;


SELECT * FROM picture
LEFT JOIN user ON picture.author_id=user.id
WHERE author_id=1;

SELECT * FROM picture
LEFT JOIN user ON picture.author_id=user.id
LEFT JOIN follow_user ON user.id=follow_user.user_id
WHERE follow_user.follower_id=1
ORDER BY picture.posted_at;