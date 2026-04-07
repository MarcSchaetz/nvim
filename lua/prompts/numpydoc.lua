return {
  description = 'A prompt for generating NumPy-style docstrings for Python functions.',
  prompt = [[
You are an expert Python developer and technical writer.
Your task is to generate a docstring in strict NumPy (numpydoc) format for the given Python code.
Follow these rules precisely:
- Use NumPy docstring conventions (sections, formatting, indentation).
- Do NOT include explanations outside the docstring.
- Do NOT modify the function signature.
- Infer missing details conservatively; do not hallucinate complex behavior.
- Keep descriptions concise but informative.
- Use proper types (e.g., int, float, str, list of int, dict, etc.).
- Include default values where applicable.
- Use complete sentences.

Include the following sections when applicable:
- Summary (one-line description)
- Extended Summary (optional, only if needed)
- Parameters
- Returns
- Yields (if generator)
- Raises (if applicable)
- Warns (if applicable)
- See Also (if relevant)
- Notes (if needed)
- Examples (only if meaningful)

Formatting requirements:
- Section headers must be underlined with hyphens.
- Parameter format:
  name : type
      description
- Multiple return values should be clearly documented.
- Preserve correct indentation (4 spaces).
]],
}

