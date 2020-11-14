package com.jonassjodin.cssc

object Hex {
    fun parse(hex: String): List<Int> {
        val pretty = if (hex[0] == '#') hex.substring(1) else hex
        val chunks = if (pretty.length == 3 || pretty.length == 4) pretty.map { it.toString().repeat(2) } else pretty.chunked(2)
        return chunks.map { Integer.parseInt(it, 16) }
    }

    fun format(li: List<Int>): String {
        val hexString = li.joinToString("") { Integer.toHexString(it).padStart(2, '0') }
        return "#${hexString.toUpperCase()}"
    }
}
