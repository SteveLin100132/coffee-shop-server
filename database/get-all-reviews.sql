SELECT coffeeshop.name AS shop, reviewer.email, review.id AS id, review.rate, review.content, review.timestamp
FROM coffeeshop
INNER JOIN review
ON coffeeshop.id=review.coffeeshopId
INNER JOIN reviewer
ON reviewer.id=review.reviewerId;