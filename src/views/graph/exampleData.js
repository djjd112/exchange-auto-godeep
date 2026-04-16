export const mockA = {
  nodes: [
    { id: 'A-SVC', label: 'A-SVC', type: 'service', status: 'UP' },
    { id: 'B-SVC', label: 'B-SVC', type: 'service', status: 'UP' },
    { id: 'C-SVC', label: 'C-SVC', type: 'service', status: 'DOWN' },
    { id: 'topic.t1', label: 'topic.t1', type: 'topic' },
    { id: 'topic.t2', label: 'topic.t2', type: 'topic' },
    { id: '/api/a/in', label: '/api/a/in', type: 'api' }
  ],
  edges: [
    { source: '/api/a/in', target: 'A-SVC', label: 'HTTP', kind: 'http' },
    { source: 'A-SVC', target: 'topic.t1', label: 'topic.t1', kind: 'kafka' },
    { source: 'topic.t1', target: 'B-SVC', label: 'topic.t1', kind: 'kafka' },
    { source: 'B-SVC', target: 'topic.t2', label: 'topic.t2', kind: 'kafka' },
    { source: 'topic.t2', target: 'C-SVC', label: 'topic.t2', kind: 'kafka' }
  ]
}


export const mockB = {
  nodes: [
    { id: 'A-SVC', label: 'A-SVC', type: 'service', status: 'UP' },
    { id: 'B-SVC', label: 'B-SVC', type: 'service', status: 'UP' },
    { id: 'C-SVC', label: 'C-SVC', type: 'service', status: 'UP' },
    { id: 'D-SVC', label: 'D-SVC', type: 'service', status: 'UP' },
    { id: 'topic.t1', label: 'topic.t1', type: 'topic' },
    { id: 'topic.t2', label: 'topic.t2', type: 'topic' },
    { id: 'topic.t3', label: 'topic.t3', type: 'topic' },
    { id: '/api/a/in', label: '/api/a/in', type: 'api' }
  ],
  edges: [
    { source: '/api/a/in', target: 'A-SVC', label: 'HTTP', kind: 'http' },
    { source: 'A-SVC', target: 'topic.t1', label: 'topic.t1', kind: 'kafka' },
    { source: 'topic.t1', target: 'B-SVC', label: 'topic.t1', kind: 'kafka' },
    { source: 'B-SVC', target: 'topic.t2', label: 'topic.t2', kind: 'kafka' },
    { source: 'topic.t2', target: 'C-SVC', label: 'topic.t2', kind: 'kafka' },
    { source: 'C-SVC', target: 'topic.t3', label: 'topic.t3', kind: 'kafka' },
    { source: 'topic.t3', target: 'D-SVC', label: 'topic.t3', kind: 'kafka' }
  ]
}