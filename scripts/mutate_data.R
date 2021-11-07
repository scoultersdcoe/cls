library(janitor)
# skip the first XX rows because Qualtrics stores un-needed information there.
cls_mutate <- cls_results %>%
  row_to_names(row_number = 1, remove_row = F, remove_rows_above = F) %>%
  slice(-c(1:3)) %>%
  # Select necessary columns
  select(id = ResponseId, duration = `Duration (in seconds)`, 
         progress = Progress, start_date = StartDate, end_date = EndDate,
         starts_with("Q")) %>%
  # Rename and tidy data
  rename(first_name = Q1_1, last_name = Q1_2, organization = Q2, email = Q3,
         satisfied = Q4, obj_1 = Q5_1, obj_2 = Q5_2, obj_3 = Q5_3, breakout = Q6, 
         br1_obj_1 = Q7_1, br1_obj_2 = Q7_2, br1_obj_3 = Q7_3, br1_obj_4 = Q7_4, 
         br2_obj_1 = Q8_1, br2_obj_2 = Q8_2, br2_obj_3 = Q8_3, br2_obj_4 = Q8_4,
         br3_obj_1 = Q9_1, br3_obj_2 = Q9_2, br3_obj_3 = Q9_3, br3_obj_4 = Q9_4,
         br4_obj_1 = Q10_1, br4_obj_2 = Q10_2, br4_obj_3 = Q10_3, br4_obj_4 = Q10_4, 
         br5_obj_1 = Q11_1, br5_obj_2 = Q11_2, br5_obj_3 = Q11_3, br4_obj_5 = Q11_4, 
         br_satisfied = Q12, one_idea = Q13, similar_event = Q14, baseline = Q15, 
         support = Q16, enhance = Q17, inequity = Q18) %>%
  clean_names() %>%
  # filter survey tests
  slice(4:n())
