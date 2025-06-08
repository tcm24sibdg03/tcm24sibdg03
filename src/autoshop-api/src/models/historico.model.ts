import {Entity, model, property, belongsTo} from '@loopback/repository';
import {Veiculo} from './veiculo.model';
import {Agendamento} from './agendamento.model';

@model()
export class Historico extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'string',
  })
  notas?: string;
  @belongsTo(() => Veiculo)
  veiculoId: number;

  @belongsTo(() => Agendamento)
  agendamentoId: number;

  constructor(data?: Partial<Historico>) {
    super(data);
  }
}

export interface HistoricoRelations {
  // describe navigational properties here
}

export type HistoricoWithRelations = Historico & HistoricoRelations;
