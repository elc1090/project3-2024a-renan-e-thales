class Item {
  id: number;
  nome: string;
  qtd: number;
  kgl: string;
  desc: string;
  categ: string;
  created_at: number;

  constructor(id: number, nome: string, qtd: number, kgl: string, desc: string, categ: string, created_at: number) {
    this.id = id;
    this.nome = nome;
    this.qtd = qtd;
    this.kgl = kgl;
    this.desc = desc;
    this.categ = categ;
    this.created_at = created_at;
  }
}
export default Item