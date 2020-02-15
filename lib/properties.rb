exempted_words = %w[exempted chocolate book food pill]
imported_words = %w[imported]

EXEMPTED_KEYWORDS = /(?:#{exempted_words.join('|')})/i
IMPORTED_KEYWORDS = /(?:#{imported_words.join('|')})/i
