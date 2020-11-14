package com.jonassjodin.cssc

import kotlin.math.roundToInt

object RGB {
    fun parseRGB(rgb: String): List<Int> {
        return parseArray(rgb.substring(4, rgb.length - 1).split(",").toTypedArray())
    }

    fun parseRGBA(rgb: String): List<Int> {
        return parseArray(rgb.substring(5, rgb.length - 1).split(",").toTypedArray())
    }

    fun parseArray(args: Array<String>): List<Int> {
        val li = args.map { Integer.parseInt(it.trim()) }
        if (li.all { it !in 0..255 }) throw IllegalArgumentException("Number not in range")
        return li
    }

    fun formatAsRGB(li: List<Int>) = "rgb(${li.joinToString()})"

    fun formatAsRGBA(li: List<Int>): String {
        val newLi = li.subList(0, 3).map { it.toString() }
        val roundOff = (((li[3] / 255f) * 100).roundToInt().toDouble() / 100).toString()
        return "rgba(${newLi.plus(roundOff).joinToString()})"
    }
}
