$(document).ready ->
  txt = $('.card-content')[1].textContent
  wordCount = txt.replace(/[^\w ]/g, '').split(/\s+/).length
  readingTimeInMinutes = Math.floor(wordCount / 250) + 1
  readingTimeAsString = readingTimeInMinutes + ' min read'
  $('.reading-time').html readingTimeAsString
  return
