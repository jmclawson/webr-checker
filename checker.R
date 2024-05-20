chunk_stepper <- function(){
  if(exists("chunk_step")) {
    chunk_step <<- chunk_step + 1
    return(chunk_step)
  } else {
    chunk_step <<- 1
  }
}
check_button <- function(answer, chunk = NULL) {
  if (is.null(chunk)) {
    chunk <- chunk_stepper()
  }
  feedback_yes <- function(){
    effusive <- c(sample(c("",
                           "Yee-haw! 🤠 ",
                           "Wowzwers! ",
                           "🙌 ",
                           "::stunned silence:: 😮 "),
                         size = 1),
                  sample(c("Yes, that’s right. ",
                           "Yep, looks right to me. ",
                           "I can’t see any errors. ",
                           "Looks perfect to me. ",
                           "Flawless. "),
                         size = 1),
                  sample(c("Well done!",
                           "",
                           "⭐️⭐️⭐️⭐️⭐️",
                           "You did it!",
                           "Top-notch work!",
                           "All this effort is sure to pay off!",
                           "You should be proud of yourself!"),
                         size = 1)
    ) |>
      paste(collapse = "")
    mild <- (sample(c("Yes, that’s right.",
                      "Correct.",
                      "You got it. 🙂"),
                    size = 1))
    sample(c(effusive, effusive, mild),
           size = 1)
  }
  feedback_no <- function(){
    c(sample(c("No, that’s not right. ",
               "That’s not what I’m looking for. "),
             size = 1),
      sample(c("Try again.",
               "Give it another go.",
               "But don’t worry. You can have another try."),
             size = 1)) |>
      paste0(collapse = "")
  }
  feedback_redo <- function(){
    c(sample(c("🤖 Does not compute... ",
               "🤔 I don’t see anything here. ",
               "Where am I looking? ",
               ""),
             size = 1),
      sample(c("Remember to put your code in the box, ",
               "Please put your code in the box, ",
               "Write some code above. When you’re ready, "),
             size = 1)) |>
      paste0(collapse = "")
  }
  link_run <- stringr::str_glue('<a onclick="runlink(\'{answer}\', this);" class="helper-link">run</a>')
  link_check <- stringr::str_glue('<a onclick="checkit({chunk}, \'{answer}\');" class="helper-link">check</a>')

  {'<input type="button" class="checker" value="Check" onclick="checkit({chunk}, \'{answer}\')" id="check-{chunk}-button">
    <div class="feedback-wrapper" id="feedback-{chunk}-wrapper" style="border: 1px dotted #444444;">
    <div class="feedback-wait" id="feedback-{chunk}-wait" style="display: block;">Put your code in the box, {link_run} it, and then {link_check} it</a>.</div>
    <div class="feedback-redo" id="feedback-{chunk}-redo" style="display: none;">{feedback_redo()} {link_run} it, and then {link_check} it.</div>
    <div class="feedback-yes" id="feedback-{chunk}-yes" style="display: none;">{feedback_yes()}</div>
    <div class="feedback-no" id="feedback-{chunk}-no" style="display: none;">{feedback_no()} Remember to re-{link_run} any changes before you {link_check}.</div>
    </div>'
  } |>
    stringr::str_glue()
}
