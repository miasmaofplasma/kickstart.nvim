return {
  ['Generate Summary For URLs in Notes'] = {
    strategy = 'chat',
    description = 'Generate a summary for the URL in a new section of the current note.',
    short_name = 'Generate Summary',
    opts = {
      auto_submit = true,
      user_prompt = false,
    },
    prompts = {
      {
        role = 'system',
        content = 'You are an experienced note-taking assistant. Your task is to generate a concise summary for the URL provided in the current note. The summary should be clear, informative, and suitable for quick reference.',
      },
      {
        role = 'user',
        content = [[
1. Open the file #{buffer} and read its contents.
2. Identify all links in the file that use Markdown link syntax (e.g., `[link text](URL)`).
3. For each link, visit the corresponding webpage using @{fetch_webpage}.
4. Summarize the main points of each webpage as if writing a professional informational article. Organize the summary clearly, use Markdown formatting, and ensure the information is easy to understand.
5. **Without deleting, modifying, or overwriting any existing content,** append a new section at the end of the file for each link using @{insert_edit_into_file}. Title each section `# AI Summary: [link text]`, and place the summary beneath the heading.
]],
      },
    },
  },
}
