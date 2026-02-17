const express = require("express");
const { chromium } = require("playwright");

const app = express();
app.use(express.json());

app.post("/run", async (req, res) => {
  const { url } = req.body;

  const browser = await chromium.launch({ headless: true });
  const page = await browser.newPage();

  await page.goto(url);
  const title = await page.title();

  await browser.close();

  res.json({ title });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
