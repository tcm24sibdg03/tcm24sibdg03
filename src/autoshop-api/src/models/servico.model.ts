import {Entity, model, property} from '@loopback/repository';

export enum TipoServico {
  REVISAO = 'Revisão',
  TROCA_OLEO = 'Troca de Óleo',
  INSPECAO = 'Inspeção',
  OUTRO = 'Outro',
}

@model()
export class Servico extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'string',
    required: true,
    jsonSchema: {
      enum: Object.values(TipoServico),
    },
  })
  tipo: TipoServico;

  @property({
    type: 'number',
    required: true,
  })
  preco: number;


  constructor(data?: Partial<Servico>) {
    super(data);
  }
}

export interface ServicoRelations {
  // describe navigational properties here
}

export type ServicoWithRelations = Servico & ServicoRelations;
