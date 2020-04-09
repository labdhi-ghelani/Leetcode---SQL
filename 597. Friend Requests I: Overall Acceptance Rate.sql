My Solution

select round( ifnull(
  (select count(distinct requester_id, accepter_id) as req_accepted_count from request_accepted )/
  (select count(distinct sender_id, send_to_id, request_date) as req_sent_count from friend_request) ,0) ,2) as accept_rate;
  
  #1. Calculate the number of accepted requests. (Requester -> Accepter) from the request_accepted table
    #1.1 But it is possible that a sender sends multiple requests to the receiver and a request can be accepted more than once. Eg: unfriends and blocks
  #2. Count only such distinct occasions. Eliminate all the multiple requests among the same pair but at different times. Eliminate on the basis of pair
  #3. Number of distinct accepted requests are 4
  
  #4. Repeat the same for number of requests sent from the friend_request table
  #5. Number of total distinct sent requests are 5 (although it is not defined if you should take distinct)
  #6. Divide it and if there are no requests use IFNULL(columnname, returnalternativevalue) and use ROUND(number,2) rounds to the nearest 2 decimal number
  
  This solution does not pass all the test cases, DOUBT!!!
  
  Accepted Solution :
  
  select round( ifnull( 
    (select count(distinct requester_id, accepter_id) from request_accepted as A) /
    (select count(distinct sender_id, send_to_id) from friend_request as B) ,0) , 2) as accept_rate
    
  The difference is placing the alias before and after the from. Need to understand how does that make a difference. 
  
  
