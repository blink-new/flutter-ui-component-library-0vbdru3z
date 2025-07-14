import React, { useState } from 'react';
import { Card } from './components/ui/card';
import { Button } from './components/ui/button';
import { Tabs, TabsContent, TabsList, TabsTrigger } from './components/ui/tabs';
import './App.css';

function App() {
  const [activeTab, setActiveTab] = useState('overview');

  const flutterFiles = [
    {
      name: 'main.dart',
      path: 'lib/main.dart',
      description: 'App entry point with MaterialApp configuration'
    },
    {
      name: 'app_theme.dart',
      path: 'lib/theme/app_theme.dart',
      description: 'Theme system with colors, typography, and styling'
    },
    {
      name: 'foodie_queue_screen.dart',
      path: 'lib/screens/foodie_queue_screen.dart',
      description: 'Main screen with Join and Hop In modes'
    },
    {
      name: 'foodie_logo.dart',
      path: 'lib/components/foodie_logo.dart',
      description: 'Logo component with gradient text and icon'
    },
    {
      name: 'gradient_button.dart',
      path: 'lib/components/gradient_button.dart',
      description: 'Primary button with orange-to-red gradient'
    },
    {
      name: 'outline_button.dart',
      path: 'lib/components/outline_button.dart',
      description: 'Secondary button with outline styling'
    },
    {
      name: 'custom_text_field.dart',
      path: 'lib/components/custom_text_field.dart',
      description: 'Input field with focus states and styling'
    },
    {
      name: 'fun_mode_toggle.dart',
      path: 'lib/components/fun_mode_toggle.dart',
      description: 'Toggle switch with gradient active state'
    }
  ];

  const colorPalette = [
    { name: 'Primary Orange', color: '#f68c3d', usage: 'Main brand color, focus states' },
    { name: 'Accent Red', color: '#f04943', usage: 'Gradient end, accent elements' },
    { name: 'Background', color: '#fef6ed', usage: 'App background, warm tone' },
    { name: 'Card Color', color: '#ffffff', usage: 'Content containers, forms' },
    { name: 'Text Primary', color: '#2D3748', usage: 'Main text content' },
    { name: 'Text Secondary', color: '#718096', usage: 'Subtitles, descriptions' },
    { name: 'Text Placeholder', color: '#A0AEC0', usage: 'Input placeholders, hints' }
  ];

  return (
    <div className="min-h-screen" style={{ backgroundColor: '#fef6ed' }}>
      <div className="container mx-auto px-4 py-8">
        {/* Header */}
        <div className="text-center mb-12">
          <div className="flex items-center justify-center mb-4">
            <div 
              className="w-12 h-12 rounded-full flex items-center justify-center mr-3"
              style={{ background: 'linear-gradient(to right, #f68c3d, #f04943)' }}
            >
              <span className="text-white text-xl">🍽️</span>
            </div>
            <h1 
              className="text-4xl font-bold"
              style={{ 
                background: 'linear-gradient(to right, #f68c3d, #f04943)',
                WebkitBackgroundClip: 'text',
                WebkitTextFillColor: 'transparent',
                backgroundClip: 'text'
              }}
            >
              Foodie Queue
            </h1>
          </div>
          <p className="text-xl text-gray-600 mb-2">Flutter UI Component Library</p>
          <p className="text-gray-500">Complete Dart code implementation with custom widgets and theme system</p>
        </div>

        {/* Tabs */}
        <Tabs value={activeTab} onValueChange={setActiveTab} className="w-full">
          <TabsList className="grid w-full grid-cols-4 mb-8">
            <TabsTrigger value="overview">Overview</TabsTrigger>
            <TabsTrigger value="components">Components</TabsTrigger>
            <TabsTrigger value="colors">Colors</TabsTrigger>
            <TabsTrigger value="structure">Structure</TabsTrigger>
          </TabsList>

          {/* Overview Tab */}
          <TabsContent value="overview" className="space-y-6">
            <div className="grid md:grid-cols-2 gap-6">
              <Card className="p-6">
                <h3 className="text-xl font-semibold mb-4" style={{ color: '#f68c3d' }}>
                  📱 Join Screen Features
                </h3>
                <ul className="space-y-2 text-gray-700">
                  <li>• Welcome message: "Join the foodie family!"</li>
                  <li>• Dual action buttons (Hop In / Join Party)</li>
                  <li>• Complete form with name, email, phone, secret</li>
                  <li>• Fun Mode toggle with party emoji</li>
                  <li>• Primary CTA: "Join the Feast! 🎉"</li>
                </ul>
              </Card>

              <Card className="p-6">
                <h3 className="text-xl font-semibold mb-4" style={{ color: '#f04943' }}>
                  🚀 Hop In Screen Features
                </h3>
                <ul className="space-y-2 text-gray-700">
                  <li>• Message: "Ready to skip the line?"</li>
                  <li>• Simplified form (phone + secret only)</li>
                  <li>• Primary CTA: "Let's Eat! 🍴"</li>
                  <li>• Forgot password link</li>
                  <li>• Streamlined user experience</li>
                </ul>
              </Card>
            </div>

            <Card className="p-6">
              <h3 className="text-xl font-semibold mb-4" style={{ color: '#2D3748' }}>
                🎨 Design System Highlights
              </h3>
              <div className="grid md:grid-cols-3 gap-4">
                <div className="text-center">
                  <div 
                    className="w-16 h-16 rounded-full mx-auto mb-2"
                    style={{ background: 'linear-gradient(to right, #f68c3d, #f04943)' }}
                  ></div>
                  <p className="font-medium">Gradient Theme</p>
                  <p className="text-sm text-gray-600">Orange to red gradient</p>
                </div>
                <div className="text-center">
                  <div className="w-16 h-16 rounded-2xl bg-white border-2 mx-auto mb-2 flex items-center justify-center" style={{ borderColor: '#f68c3d' }}>
                    <span className="text-gray-400">Aa</span>
                  </div>
                  <p className="font-medium">Sans-Serif Typography</p>
                  <p className="text-sm text-gray-600">Inter font family</p>
                </div>
                <div className="text-center">
                  <div className="w-16 h-16 rounded-2xl bg-white shadow-lg mx-auto mb-2 flex items-center justify-center">
                    <span style={{ color: '#f68c3d' }}>📱</span>
                  </div>
                  <p className="font-medium">Mobile-First</p>
                  <p className="text-sm text-gray-600">Responsive design</p>
                </div>
              </div>
            </Card>
          </TabsContent>

          {/* Components Tab */}
          <TabsContent value="components" className="space-y-4">
            <div className="grid gap-4">
              {flutterFiles.map((file, index) => (
                <Card key={index} className="p-4">
                  <div className="flex items-center justify-between">
                    <div>
                      <h4 className="font-semibold text-lg" style={{ color: '#2D3748' }}>
                        {file.name}
                      </h4>
                      <p className="text-gray-600 text-sm mb-1">{file.path}</p>
                      <p className="text-gray-500 text-sm">{file.description}</p>
                    </div>
                    <div className="text-2xl">
                      {file.name.includes('main') ? '🚀' :
                       file.name.includes('theme') ? '🎨' :
                       file.name.includes('screen') ? '📱' :
                       file.name.includes('logo') ? '🏷️' :
                       file.name.includes('button') ? '🔘' :
                       file.name.includes('field') ? '📝' :
                       file.name.includes('toggle') ? '🔄' : '📄'}
                    </div>
                  </div>
                </Card>
              ))}
            </div>
          </TabsContent>

          {/* Colors Tab */}
          <TabsContent value="colors" className="space-y-4">
            <div className="grid md:grid-cols-2 gap-4">
              {colorPalette.map((color, index) => (
                <Card key={index} className="p-4">
                  <div className="flex items-center space-x-4">
                    <div 
                      className="w-16 h-16 rounded-lg shadow-inner"
                      style={{ backgroundColor: color.color }}
                    ></div>
                    <div className="flex-1">
                      <h4 className="font-semibold text-lg" style={{ color: '#2D3748' }}>
                        {color.name}
                      </h4>
                      <p className="text-gray-600 font-mono text-sm">{color.color}</p>
                      <p className="text-gray-500 text-sm">{color.usage}</p>
                    </div>
                  </div>
                </Card>
              ))}
            </div>
          </TabsContent>

          {/* Structure Tab */}
          <TabsContent value="structure" className="space-y-6">
            <Card className="p-6">
              <h3 className="text-xl font-semibold mb-4" style={{ color: '#f68c3d' }}>
                📁 Project Structure
              </h3>
              <div className="bg-gray-50 p-4 rounded-lg font-mono text-sm">
                <div className="space-y-1">
                  <div>lib/</div>
                  <div className="ml-4">├── main.dart <span className="text-gray-500"># App entry point</span></div>
                  <div className="ml-4">├── theme/</div>
                  <div className="ml-8">└── app_theme.dart <span className="text-gray-500"># Theme configuration</span></div>
                  <div className="ml-4">├── screens/</div>
                  <div className="ml-8">└── foodie_queue_screen.dart <span className="text-gray-500"># Main screen</span></div>
                  <div className="ml-4">└── components/</div>
                  <div className="ml-8">├── foodie_logo.dart <span className="text-gray-500"># Logo component</span></div>
                  <div className="ml-8">├── gradient_button.dart <span className="text-gray-500"># Primary button</span></div>
                  <div className="ml-8">├── outline_button.dart <span className="text-gray-500"># Secondary button</span></div>
                  <div className="ml-8">├── custom_text_field.dart <span className="text-gray-500"># Input field</span></div>
                  <div className="ml-8">└── fun_mode_toggle.dart <span className="text-gray-500"># Toggle switch</span></div>
                </div>
              </div>
            </Card>

            <div className="grid md:grid-cols-2 gap-6">
              <Card className="p-6">
                <h3 className="text-xl font-semibold mb-4" style={{ color: '#f04943' }}>
                  🔧 Key Features
                </h3>
                <ul className="space-y-2 text-gray-700">
                  <li>• Modular component architecture</li>
                  <li>• Flutter-inspired design patterns</li>
                  <li>• Interactive component demos</li>
                  <li>• Focus state management</li>
                  <li>• Gradient theming system</li>
                  <li>• Sans-serif typography hierarchy</li>
                  <li>• Clean card-based layout</li>
                  <li>• Responsive component grid</li>
                </ul>
              </Card>

              <Card className="p-6">
                <h3 className="text-xl font-semibold mb-4" style={{ color: '#718096' }}>
                  📋 Implementation Notes
                </h3>
                <ul className="space-y-2 text-gray-700">
                  <li>• StatefulWidget for screen management</li>
                  <li>• TextEditingController for form inputs</li>
                  <li>• Custom theme system integration</li>
                  <li>• Gradient backgrounds and buttons</li>
                  <li>• Focus border highlighting (#f68c3d)</li>
                  <li>• Animation and transition support</li>
                  <li>• Material Design principles</li>
                  <li>• Accessibility considerations</li>
                </ul>
              </Card>
            </div>
          </TabsContent>
        </Tabs>

        {/* Footer */}
        <div className="text-center mt-12 p-6 bg-white rounded-lg shadow-sm">
          <p className="text-gray-600 mb-2">
            Complete Flutter Dart implementation ready for development
          </p>
          <p className="text-sm text-gray-500">
            All components follow Flutter best practices with proper state management and theming
          </p>
        </div>
      </div>
    </div>
  );
}

export default App;