#
# scrape_leetcode.py
#  SyntaxFound
#
#  Created by Benita Besa on 4/12/25.
#

from leetscrape import GetQuestionsList
import json

# 1. Initialize the scraper
scraper = GetQuestionsList()

# 2. Scrape LeetCode questions (this pulls all by default!)
scraper.scrape()

# 3. Convert to list of dicts
questions_list = scraper.questions.to_dict(orient="records")

# 4. Optional: limit to first 100
limited = questions_list[:100]

# 5. Save to JSON
with open("leetcode_problems.json", "w") as f:
    json.dump(limited, f, indent=2)

print("✅ Scraped and saved 100 LeetCode problems to leetcode_problems.json")


