//
//  bfs_practice.swift
//  CodeTest
//
//  Created by AlexHwang on 2022/03/30.
//

import Foundation


struct Queue<T> {
    private var queue: [T] = []
    
    public var count: Int {
        return queue.count
    }
    
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    
    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : queue.removeFirst()
    }
}


class Node<T> {
    let value: T
    var edges = [Edge<T>]()
    
    var visited = false
    
    init(value: T) {
        self.value = value
    }
    
    func appendEdgeTo(_ node: Node<T>) {
        let edge = Edge<T>(from: self, to: node)
        self.edges.append(edge)
    }
}

class Edge<T> {
    weak var source: Node<T>?
    let destination: Node<T>
    
    init(from source: Node<T>, to destination: Node<T>) {
        self.source = source
        self.destination = destination
    }
}

func practiceBFS(n: Int, edges: [(Int, Int)]) {
    // node, edge setup
    let nodes = (0..<n).map { Node<Int>(value: $0 + 1) }
    
    print("type: ", type(of: edges))
    
    for (from, to) in edges {
        nodes[from - 1].appendEdgeTo(nodes[to - 1])
    }
    
    var shortest = Array(repeating: [1], count: n)
    
    var queue = Queue<Node<Int>>()
    queue.enqueue(nodes[0])
    nodes[0].visited = true
    
    while let node = queue.dequeue() {
        for edge in node.edges {
            let dest = edge.destination
            guard dest.visited == false else { continue }
            queue.enqueue(dest)
            dest.visited = true
            
            shortest[dest.value - 1] = shortest[node.value - 1] + [dest.value]
        }
    }
    
    print(shortest)
    
}

