//: [Previous](@previous)

import Foundation

class Solution {
    
    func hasPath(_ graph: [String: [String]], source: String, destination: String) -> Bool {
        guard let neighBours = graph[source], !neighBours.isEmpty else { return false }
        var queue = [String]()
        queue.enqueue(source)
        while !queue.isEmpty {
            let currentNode = queue.dequeue()!
            if currentNode == destination {
                return true
            }
            
            if let currentNodeNeighBours = graph[currentNode] {
                for neighbour in currentNodeNeighBours {
                    queue.enqueue(neighbour)
                }
            }
        }
        return false
    }
    
     private func convertEdgelistToUndirectedGraph(_ edgeList: [[String]]) -> [String: [String]] {
        var undirectedGraph = [String: [String]]()
        
        for edge in edgeList {
            for index in 0..<edge.count {
                if index == 0 {
                    undirectedGraph[edge.first!,default: []] += [edge.last!]
                } else {
                    undirectedGraph[edge.last!,default: []] += [edge.first!]
                }
            }
        }
         return undirectedGraph
    }
    
    func hasPath(_ edgeList: [[String]], source: String, destination: String) -> Bool {
        let graph = convertEdgelistToUndirectedGraph(edgeList)
        guard let neighBours = graph[source], !neighBours.isEmpty else { return false }
        var queue = [String]()
        var visitedNodes = [String]()
        queue.enqueue(source)
        while !queue.isEmpty {
            let currentNode = queue.dequeue()!
            
            //handle the cycles
            if !visitedNodes.contains(currentNode) {
                visitedNodes.append(currentNode)
            } else {
                continue
            }
            
            if currentNode == destination {
                return true
            }
            
            if let currentNodeNeighBours = graph[currentNode] {
                for neighbour in currentNodeNeighBours {
                    queue.enqueue(neighbour)
                }
            }
        }
        return false
    }
    
    func numberOfConnectedComponents(_ edges: [[String]]) -> Int {
        let graph = convertEdgelistToUndirectedGraph(edges)
        
        var visitedNodes = [String]()
        
        var count = 0
        
        for node in graph {
            let source = node.key
            if !visitedNodes.contains(source), let neighBours = graph[source], !neighBours.isEmpty {
                var queue = [String]()
                queue.enqueue(source)
                while !queue.isEmpty {
                    let currentNode = queue.dequeue()!
                    
                    //handle the cycles
                    if !visitedNodes.contains(currentNode) {
                        visitedNodes.append(currentNode)
                    } else {
                        continue
                    }
                    
                    if let currentNodeNeighBours = graph[currentNode] {
                        for neighbour in currentNodeNeighBours {
                            queue.enqueue(neighbour)
                        }
                    }
                }
                count += 1
            }
        }
        
        return count
    }
    
    func largestComponent(_ edges: [[String]]) -> Int {
        let graph = convertEdgelistToUndirectedGraph(edges)
        
        var visitedNodes = [String]()
        
        var maxComponent = 0
        
        for node in graph {
            let source = node.key
            if !visitedNodes.contains(source), let neighBours = graph[source], !neighBours.isEmpty {
                var currentMaxComponet = 0
                var queue = [String]()
                queue.enqueue(source)
                while !queue.isEmpty {
                    let currentNode = queue.dequeue()!
                    
                    //handle the cycles
                    if !visitedNodes.contains(currentNode) {
                        visitedNodes.append(currentNode)
                        currentMaxComponet += 1
                    } else {
                        continue
                    }
                    
                    if let currentNodeNeighBours = graph[currentNode] {
                        for neighbour in currentNodeNeighBours {
                            queue.enqueue(neighbour)
                        }
                    }
                }
                maxComponent = max(maxComponent, currentMaxComponet)
            }
        }
        
        return maxComponent
    }
    
    func shortestPath(_ edges: [[String]], source: String, destination: String) -> Int? {
        let graph = convertEdgelistToUndirectedGraph(edges)
        
        var visitedNodes = [String]()
        
        var queue = [(String,Int)]()// node and distance traveled
        queue.enqueue((source, 0))
        
        var shortestPath: Int!
        if !visitedNodes.contains(source), let neighBours = graph[source], !neighBours.isEmpty {

            
            while !queue.isEmpty {
                let currentNode = queue.dequeue()!
                
                if currentNode.0 == destination {
                    if shortestPath != nil {
                        shortestPath = min(shortestPath, currentNode.1)
                    } else {
                        shortestPath = currentNode.1
                    }
                }
                
                //handle the cycles
                if !visitedNodes.contains(currentNode.0) {
                    visitedNodes.append(currentNode.0)
                } else {
                    continue
                }
                
                if let currentNodeNeighBours = graph[currentNode.0] {
                    for neighbour in currentNodeNeighBours {
                        queue.enqueue((neighbour, currentNode.1 + 1))
                    }
                }
            }
        }
        
        return shortestPath
    }
}

let directedGraph = [
             "f": ["g", "i"],
             "g": ["h"],
             "h": [],
             "i": ["g", "k"],
             "j": ["i"],
             "k": []
             ]

/*
                f ―――→ i ―――→ k
                |    / ↑
                ↓  ↙   |
                g      j
                |
                ↓
                h
 
 */

let edges = [
                ["i", "j"],
                ["k", "i"],
                ["m", "k"],
                ["k", "l"],
                ["o", "n"],
            ]

/*
                i ――― j
                |   /
                |  /
                k ――― l
                |
                |
                m
 
                o ――― n   cyclies at ijk and on
 
 */

let edges2 = [
                ["i", "j"],
                ["k", "i"],
                ["m", "k"],
                ["o", "n"],
                ["o", "a"],
                ["a", "n"],
                ["n", "b"],
            ]

let edges3 = [
                ["i", "j"],
                ["k", "i"],
                ["m", "k"],
                ["o", "n"],
                ["a", "b"],
                ["b", "c"]
            ]

import XCTest

class SolutionTests: XCTestCase {

    func test() {
        XCTAssertEqual(Solution().hasPath(directedGraph, source: "f", destination: "j"), false)
        XCTAssertEqual(Solution().hasPath(directedGraph, source: "f", destination: "k"), true)
        XCTAssertEqual(Solution().hasPath(directedGraph, source: "f", destination: "h"), true)
        XCTAssertEqual(Solution().hasPath(directedGraph, source: "j", destination: "k"), true)
        XCTAssertEqual(Solution().hasPath(directedGraph, source: "i", destination: "f"), false)
        XCTAssertEqual(Solution().hasPath(directedGraph, source: "i", destination: "h"), true)
        
        
        XCTAssertEqual(Solution().hasPath(edges, source: "i", destination: "l"), true)
        XCTAssertEqual(Solution().hasPath(edges, source: "i", destination: "o"), false)
        XCTAssertEqual(Solution().hasPath(edges, source: "l", destination: "n"), false)
        XCTAssertEqual(Solution().hasPath(edges, source: "l", destination: "j"), true)

        XCTAssertEqual(Solution().numberOfConnectedComponents(edges), 2)
        XCTAssertEqual(Solution().numberOfConnectedComponents(edges2), 2)
        XCTAssertEqual(Solution().numberOfConnectedComponents(edges3), 3)
        
        XCTAssertEqual(Solution().largestComponent(edges), 5)
        XCTAssertEqual(Solution().largestComponent(edges2), 4)
        XCTAssertEqual(Solution().largestComponent(edges3), 4)
        
        XCTAssertEqual(Solution().shortestPath(edges, source: "i", destination: "m"), 2)
        XCTAssertEqual(Solution().shortestPath(edges, source: "i", destination: "l"), 2)
        XCTAssertEqual(Solution().shortestPath(edges, source: "i", destination: "n"), nil)
    }
}
SolutionTests.defaultTestSuite.run()
