from langgraph.graph import StateGraph, START, END
from typing import TypedDict

def make_graph() -> StateGraph:

    builder = StateGraph(State)

    builder.add_node("read_bill", read_bill)
    builder.add_node("parse_bill", parse_bill)
    builder.add_node("summarize_bill", summarize_bill)
    builder.add_node("generate_report", generate_report)
    builder.add_node("save_report", save_report)
    builder.add_node("end", end)

    builder.add_edge(START, "read_bill")
    builder.add_edge("read_bill", "parse_bill")
    builder.add_edge("parse_bill", "summarize_bill")
    builder.add_edge("summarize_bill", "generate_report")
    builder.add_edge("generate_report", "save_report")
    builder.add_edge("save_report", END)

    return builder.compile()

