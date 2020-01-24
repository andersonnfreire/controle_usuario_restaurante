unit Produto;

interface

Type
  TProduto = class
    private
      FTipo: String;
      FNome: String;
      FPreco: real;
    FTotal: integer;
    procedure setNome(const Value: String);
    procedure setPreco(const Value: real);
    procedure setTipo(const Value: String);
    procedure SetTotal(const Value: integer);

    protected
    { protected declarations }
    public
    { public declarations }
    property Tipo: String read FTipo write setTipo;
    property Nome: String read FNome write setNome;
    property Preco: real read FPreco write setPreco;
    property Total : integer read FTotal write SetTotal;
    published
      { published declarations }
end;

implementation


procedure TProduto.setNome(const Value: String);
begin
  FNome := Value;
end;

procedure TProduto.setPreco(const Value: Real);
begin
  FPreco := Value;
end;

procedure TProduto.setTipo(const Value: String);
begin
  FTipo := Value;
end;

procedure TProduto.SetTotal(const Value: integer);
begin
  FTotal := Value;
end;

end.