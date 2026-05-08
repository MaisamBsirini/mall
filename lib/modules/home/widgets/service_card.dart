import 'package:flutter/material.dart';
import 'package:mall/data/models/service_model.dart';

class ServiceCard extends StatelessWidget {
  final ServiceModel service;

  const ServiceCard({required this.service});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),

      child: Stack(
        children: [
          /// image
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              service.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),

          /// favorite
          Positioned(
            top: 10,
            right: 10,
            child: Icon(Icons.favorite_border, color: Colors.white),
          ),

          /// bottom glass
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,

            child: Container(
              padding: EdgeInsets.all(12),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
                color: Colors.white.withOpacity(0.6),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(service.name,
                      style: TextStyle(fontWeight: FontWeight.bold)),

                  Row(
                    children: List.generate(
                      5,
                      (i) => Icon(Icons.star,
                          size: 12, color: Colors.amber),
                    ),
                  ),

                  Text("Open Now",
                      style: TextStyle(color: Colors.green)),

                  Text("View Store",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}