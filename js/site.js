// Small extras on top of the static site Ignite generates.
(function () {
  // Opening hours: [open, close] in 24h time, indexed by getDay() (Sunday = 0)
  var HOURS = [null, null, [9, 18], [9, 18], [9, 20], [9, 18], [9, 17]];
  var fmt = function (h) { return (h > 12 ? h - 12 : h) + (h >= 12 ? "pm" : "am"); };

  function updateStatus() {
    var now = new Date();
    var today = HOURS[now.getDay()];
    var h = now.getHours() + now.getMinutes() / 60;
    var open = !!today && h >= today[0] && h < today[1];
    var el = document.getElementById("status");
    if (el) {
      el.textContent = open ? "Open until " + fmt(today[1]) : "Closed now";
      el.classList.toggle("is-open", open);
    }
    document.querySelectorAll("[data-weekday]").forEach(function (row) {
      row.classList.toggle("is-today", Number(row.dataset.weekday) === now.getDay());
    });
  }
  updateStatus();
  setInterval(updateStatus, 60000);

  // Quote builder
  var total = document.getElementById("quote-total");
  var meta = document.getElementById("quote-meta");
  var cards = Array.prototype.slice.call(document.querySelectorAll(".svc"));

  function updateQuote() {
    var picked = cards.filter(function (c) { return c.getAttribute("aria-pressed") === "true"; });
    var price = 0, mins = 0;
    picked.forEach(function (c) { price += Number(c.dataset.price); mins += Number(c.dataset.minutes); });
    if (total) total.textContent = "€" + price;
    if (meta) {
      if (!picked.length) { meta.textContent = "Nothing picked yet"; return; }
      var when = mins <= 60 ? "while you wait" : mins <= 180 ? "same day" : "next working day";
      meta.textContent = picked.length + (picked.length === 1 ? " job" : " jobs") + ", ready " + when;
    }
  }
  cards.forEach(function (card) {
    card.addEventListener("click", function () {
      card.setAttribute("aria-pressed", card.getAttribute("aria-pressed") === "true" ? "false" : "true");
      updateQuote();
    });
  });
  updateQuote();
})();
