import parser, { Schema, DataSource } from './parser/index'

export default class P2 {
  static parse(p2: string): P2 {
    const schema = parser.parse(p2, {})
    return new P2(schema)
  }

  private constructor(private readonly schema: Schema) {}

  get datasources(): Datasource[] {
    let dss: DataSource[] = []
    for (let block of this.schema.blocks) {
      if (block.type === 'datasource') {
        dss.push(block)
      }
    }
    return dss.map((ds) => new Datasource(ds))
  }
}

class Datasource {
  constructor(private readonly node: DataSource) {}
  get provider(): string | undefined {
    const provider = this.node.assignments.find(
      (assignment) => assignment.key === 'provider'
    )
    if (!provider) return
    switch (provider.value.type) {
      case 'string_value':
        return provider.value.value
      default:
        throw new Error(
          `datasource ${this.node.name} "provider" attribute must be a string, but got ${provider.value.type}`
        )
    }
  }
}