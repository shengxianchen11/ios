//
//  PicView.swift
//  FinalProject
//
//  Created by Mislandire-Shao on 12/5/20.
//

import SwiftUI

struct PicSqView: View {
    var sq : Square
    var body: some View {
        if sq.val == 0 {
            GeometryReader { geometry in
                RoundedRectangle(cornerRadius: 5).frame(width: geometry.size.width, height: geometry.size.width).foregroundColor(Color(#colorLiteral(red: 0.7983984351, green: 0.752638638, blue: 0.6999952197, alpha: 1)))
            }
        } else {
            let color : Color = sq.val <= 4 ? Color(#colorLiteral(red: 0.4253376424, green: 0.3837821484, blue: 0.3443741798, alpha: 1)) : Color(#colorLiteral(red: 0.9559649825, green: 0.957693398, blue: 0.9264921546, alpha: 1))
            GeometryReader { geometry in
                ZStack {
                    RoundedRectangle(cornerRadius: 5).frame(width: geometry.size.width, height: geometry.size.width).foregroundColor(sq.color)
//                    Text("\(String(sq.val))").font(.system(size: geometry.size.width / 3)).foregroundColor(color)
                    Image("\(sq.val)").resizable().frame(width: geometry.size.width, height: geometry.size.width)
                }
                
            }
        }
    }
}

struct PicSqView_Previews: PreviewProvider {
    static var previews: some View {
        PicSqView(sq: Square(val: 0))
    }
}
