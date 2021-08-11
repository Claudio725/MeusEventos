//
//  CapaEvento.swift
//  MeusEventos
//
//  Created by CLAUDIO JOSÉ DA SILVA MENEZES on 11/08/21.
//

import UIKit

@IBDesignable
class CapaEvento: UIView {

    @IBOutlet var view: UIView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    @IBOutlet weak var imagem: UIImageView!
    @IBOutlet weak var LabelEventos: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.carregarXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.carregarXib()
    }
    
    private func carregarXib() {
        let bundle = Bundle.init(for: type(of: self))
        
        //o nibName na verdade é o nome do arquivo xib que você criou
        let nib = UINib(nibName: "CapaEvento", bundle: bundle)
        
        //aqui instanciamos ele
        self.view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView
        
        //aqui está o segredo para nosso componente ser reutilizável e se adaptar. Como nossa própria classe é uma view, ela será o container. basta dizer que a view pai é do tamanho do container.
        view.frame = self.bounds
        
        //e depois de tudo, carregamos ele na nossa view pai
        self.addSubview(view)
    }
    
    @IBInspectable var imagem_p: UIImage? {
        get {
            return self.imagem.image
        }
        set {
            self.imagem.image = newValue
        }
    }
    
    @IBInspectable var titulo: String? {
        get {
            return self.LabelEventos.text
        }
        set {
            self.LabelEventos.text = newValue
        }
    }
}
