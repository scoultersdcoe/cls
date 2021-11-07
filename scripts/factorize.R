# store survey responses for factorizing
agreement <- c("Strongly agree", "Agree", "Neither agree nor disagree", 
               "Disagree", "Strongly disagree")

satisfaction <- c("Extremely satisfied", 
                "Satisfied", 
                "Neither satisfied nor dissatisfied", 
                "Dissatisfied",
                "Extremely dissatisfied")

yes_no <- c("Yes", "No")


# factorize survey variables
cls_factorize <- cls_mutate %>%
  mutate(similar_event = factor(similar_event, levels = yes_no, ordered = TRUE)) %>% 
  mutate_at(vars(satisfied, br_satisfied), 
            list(~factor(., levels = satisfaction, ordered = TRUE)),
            vars(obj_1, obj_2, obj_3, br1_obj_1, br1_obj_2, br1_obj_3, br1_obj_4,
                 br2_obj_1, br2_obj_2, br2_obj_3, br2_obj_4, br3_obj_1, br3_obj_2,
                 br3_obj_3, br3_obj_4, br4_obj_1, br4_obj_2, br4_obj_3, br4_obj_4,
                 br5_obj_1, br5_obj_2, br5_obj_3, br5_obj_4),
            list(~factor(., levels = agreement, ordered = TRUE)))

# Save final data
saveRDS(cls_factorize, here("data", "processed", "cls_clean.rds"))
write.csv(cls_factorize, file = 
            here("data", "processed", "cls_clean.csv"))
