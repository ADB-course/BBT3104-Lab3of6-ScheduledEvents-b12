-- CREATE EVN_average_customer_waiting_time_every_1_hour
CREATE EVENT EVN_average_customer_waiting_time_every_1_hour
ON SCHEDULE EVERY 1 HOUR
DO
INSERT INTO customer_service_kpi (customer_service_KPI_average_waiting_time_minutes)
SELECT AVG(TIMESTAMPDIFF(MINUTE, ticket_created_time, ticket_resolved_time))
FROM customer_service_ticket
WHERE ticket_created_time >= DATE_SUB(NOW(), INTERVAL 1 HOUR);
