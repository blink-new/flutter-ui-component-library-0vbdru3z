import React, { useState } from 'react';
import { FlutterText } from './components/flutter/FlutterText';
import { FlutterButton } from './components/flutter/FlutterButton';
import { FlutterTextField } from './components/flutter/FlutterTextField';
import { FlutterTabs } from './components/flutter/FlutterTabs';
import { FlutterCard } from './components/flutter/FlutterCard';

function App() {
  const [textFieldValue, setTextFieldValue] = useState('');
  const [passwordValue, setPasswordValue] = useState('');
  const [multilineValue, setMultilineValue] = useState('');

  // Tab content for the component showcase
  const tabItems = [
    {
      id: 'text',
      label: 'Text Widgets',
      content: (
        <div className="space-y-6">
          <div className="space-y-4">
            <FlutterText variant="headline" weight="bold">Text Widget Variants</FlutterText>
            <div className="grid gap-4">
              <div className="space-y-2">
                <FlutterText variant="display" weight="bold" color="primary">Display Text</FlutterText>
                <FlutterText variant="caption" color="secondary">Large display text for headers</FlutterText>
              </div>
              <div className="space-y-2">
                <FlutterText variant="headline" weight="semibold">Headline Text</FlutterText>
                <FlutterText variant="caption" color="secondary">Medium headline for sections</FlutterText>
              </div>
              <div className="space-y-2">
                <FlutterText variant="title" weight="medium">Title Text</FlutterText>
                <FlutterText variant="caption" color="secondary">Smaller title for subsections</FlutterText>
              </div>
              <div className="space-y-2">
                <FlutterText variant="body">Body Text</FlutterText>
                <FlutterText variant="caption" color="secondary">Regular body text for content</FlutterText>
              </div>
              <div className="space-y-2">
                <FlutterText variant="label" weight="medium">Label Text</FlutterText>
                <FlutterText variant="caption" color="secondary">Small label text for forms</FlutterText>
              </div>
              <div className="space-y-2">
                <FlutterText variant="caption" color="accent">Caption Text</FlutterText>
                <FlutterText variant="caption" color="secondary">Smallest text for captions</FlutterText>
              </div>
            </div>
          </div>
        </div>
      )
    },
    {
      id: 'buttons',
      label: 'Button Widgets',
      content: (
        <div className="space-y-6">
          <FlutterText variant="headline" weight="bold">Button Widget Variants</FlutterText>
          
          <div className="space-y-6">
            <div className="space-y-3">
              <FlutterText variant="title" weight="medium">Button Variants</FlutterText>
              <div className="flex flex-wrap gap-4">
                <FlutterButton variant="filled">Filled Button</FlutterButton>
                <FlutterButton variant="elevated">Elevated Button</FlutterButton>
                <FlutterButton variant="outlined">Outlined Button</FlutterButton>
                <FlutterButton variant="text">Text Button</FlutterButton>
              </div>
            </div>
            
            <div className="space-y-3">
              <FlutterText variant="title" weight="medium">Button Sizes</FlutterText>
              <div className="flex flex-wrap items-center gap-4">
                <FlutterButton size="small">Small</FlutterButton>
                <FlutterButton size="medium">Medium</FlutterButton>
                <FlutterButton size="large">Large</FlutterButton>
              </div>
            </div>
            
            <div className="space-y-3">
              <FlutterText variant="title" weight="medium">Button States</FlutterText>
              <div className="flex flex-wrap gap-4">
                <FlutterButton>Normal</FlutterButton>
                <FlutterButton disabled>Disabled</FlutterButton>
              </div>
            </div>
          </div>
        </div>
      )
    },
    {
      id: 'textfields',
      label: 'TextField Widgets',
      content: (
        <div className="space-y-6">
          <FlutterText variant="headline" weight="bold">TextField Widget Variants</FlutterText>
          
          <div className="space-y-6 max-w-md">
            <FlutterTextField
              label="Basic Text Field"
              placeholder="Enter your text here..."
              value={textFieldValue}
              onChange={setTextFieldValue}
              helperText="This is a basic text field with focus border #f68c3d"
            />
            
            <FlutterTextField
              label="Password Field"
              type="password"
              placeholder="Enter your password..."
              value={passwordValue}
              onChange={setPasswordValue}
              helperText="Password field with secure input"
            />
            
            <FlutterTextField
              label="Email Field"
              type="email"
              placeholder="Enter your email..."
              helperText="Email field with validation"
            />
            
            <FlutterTextField
              label="Multiline Text Field"
              placeholder="Enter multiple lines of text..."
              multiline
              rows={4}
              value={multilineValue}
              onChange={setMultilineValue}
              helperText="Multiline text field for longer content"
            />
            
            <FlutterTextField
              label="Disabled Field"
              placeholder="This field is disabled"
              disabled
              helperText="This field cannot be edited"
            />
            
            <FlutterTextField
              label="Error State"
              placeholder="This field has an error"
              error="This field is required"
            />
          </div>
        </div>
      )
    },
    {
      id: 'tabs',
      label: 'Tab Widgets',
      content: (
        <div className="space-y-6">
          <FlutterText variant="headline" weight="bold">Tab Widget System</FlutterText>
          
          <div className="space-y-4">
            <FlutterText variant="body" color="secondary">
              This is an example of the Tab widget system. You can create multiple tabs with different content.
            </FlutterText>
            
            <FlutterTabs
              tabs={[
                {
                  id: 'overview',
                  label: 'Overview',
                  content: (
                    <div className="space-y-4">
                      <FlutterText variant="title" weight="medium">Tab Overview</FlutterText>
                      <FlutterText variant="body">
                        This tab system provides a clean way to organize content into different sections.
                        Each tab can contain any React content and supports smooth transitions.
                      </FlutterText>
                    </div>
                  )
                },
                {
                  id: 'features',
                  label: 'Features',
                  content: (
                    <div className="space-y-4">
                      <FlutterText variant="title" weight="medium">Tab Features</FlutterText>
                      <ul className="space-y-2">
                        <li><FlutterText variant="body">• Smooth transitions between tabs</FlutterText></li>
                        <li><FlutterText variant="body">• Active state highlighting</FlutterText></li>
                        <li><FlutterText variant="body">• Keyboard navigation support</FlutterText></li>
                        <li><FlutterText variant="body">• Customizable styling</FlutterText></li>
                      </ul>
                    </div>
                  )
                },
                {
                  id: 'usage',
                  label: 'Usage',
                  content: (
                    <div className="space-y-4">
                      <FlutterText variant="title" weight="medium">How to Use</FlutterText>
                      <FlutterText variant="body">
                        Simply pass an array of tab objects with id, label, and content properties.
                        The component handles all the state management and transitions automatically.
                      </FlutterText>
                    </div>
                  )
                }
              ]}
            />
          </div>
        </div>
      )
    }
  ];

  return (
    <div className="min-h-screen bg-gradient-to-br from-orange-50 to-red-50">
      {/* Header */}
      <header className="bg-white shadow-sm border-b border-gray-100">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6">
          <div className="flex items-center justify-between">
            <div>
              <FlutterText variant="headline" weight="bold" color="primary">
                Flutter UI Component Library
              </FlutterText>
              <FlutterText variant="body" color="secondary" className="mt-1">
                A comprehensive collection of Flutter-inspired React components
              </FlutterText>
            </div>
            <div className="flutter-gradient p-3 rounded-lg">
              <FlutterText variant="label" weight="medium" className="text-white">
                v1.0.0
              </FlutterText>
            </div>
          </div>
        </div>
      </header>

      {/* Main Content */}
      <main className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        {/* Introduction Card */}
        <FlutterCard 
          title="Component Tree Structure" 
          subtitle="Organized Flutter-style widgets with consistent theming"
          className="mb-8"
        >
          <div className="grid grid-cols-2 md:grid-cols-4 gap-4 text-center">
            <div className="p-4 bg-orange-50 rounded-lg">
              <FlutterText variant="label" weight="medium" color="primary">Text Widget</FlutterText>
              <FlutterText variant="caption" color="secondary" className="mt-1">Typography system</FlutterText>
            </div>
            <div className="p-4 bg-red-50 rounded-lg">
              <FlutterText variant="label" weight="medium" color="accent">Button Widget</FlutterText>
              <FlutterText variant="caption" color="secondary" className="mt-1">Interactive buttons</FlutterText>
            </div>
            <div className="p-4 bg-orange-50 rounded-lg">
              <FlutterText variant="label" weight="medium" color="primary">TextField Widget</FlutterText>
              <FlutterText variant="caption" color="secondary" className="mt-1">Input components</FlutterText>
            </div>
            <div className="p-4 bg-red-50 rounded-lg">
              <FlutterText variant="label" weight="medium" color="accent">Tab Widget</FlutterText>
              <FlutterText variant="caption" color="secondary" className="mt-1">Navigation tabs</FlutterText>
            </div>
          </div>
        </FlutterCard>

        {/* Component Showcase */}
        <FlutterCard className="mb-8">
          <FlutterTabs tabs={tabItems} />
        </FlutterCard>

        {/* Color Palette Card */}
        <FlutterCard title="Color Palette" subtitle="Flutter-inspired color scheme" className="mb-8">
          <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
            <div className="text-center">
              <div className="w-full h-16 bg-orange-500 rounded-lg mb-2"></div>
              <FlutterText variant="label" weight="medium">Primary</FlutterText>
              <FlutterText variant="caption" color="secondary">#f68c3d</FlutterText>
            </div>
            <div className="text-center">
              <div className="w-full h-16 bg-red-500 rounded-lg mb-2"></div>
              <FlutterText variant="label" weight="medium">Accent</FlutterText>
              <FlutterText variant="caption" color="secondary">#f04943</FlutterText>
            </div>
            <div className="text-center">
              <div className="w-full h-16 bg-white border-2 border-gray-200 rounded-lg mb-2"></div>
              <FlutterText variant="label" weight="medium">Card</FlutterText>
              <FlutterText variant="caption" color="secondary">#ffffff</FlutterText>
            </div>
            <div className="text-center">
              <div className="w-full h-16 rounded-lg mb-2" style={{backgroundColor: '#fef6ed'}}></div>
              <FlutterText variant="label" weight="medium">Background</FlutterText>
              <FlutterText variant="caption" color="secondary">#fef6ed</FlutterText>
            </div>
          </div>
        </FlutterCard>

        {/* Typography Card */}
        <FlutterCard title="Typography" subtitle="Sans-serif font family with consistent hierarchy">
          <div className="space-y-4">
            <FlutterText variant="body" color="secondary">
              All components use the Inter font family for clean, modern typography that works well across all devices and screen sizes.
            </FlutterText>
            <div className="flex flex-wrap gap-4">
              <FlutterButton variant="filled">Get Started</FlutterButton>
              <FlutterButton variant="outlined">View Documentation</FlutterButton>
            </div>
          </div>
        </FlutterCard>
      </main>

      {/* Footer */}
      <footer className="bg-white border-t border-gray-100 mt-16">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
          <div className="text-center">
            <FlutterText variant="body" color="secondary">
              Built with React, TypeScript, and Tailwind CSS
            </FlutterText>
            <FlutterText variant="caption" color="secondary" className="mt-2">
              Flutter-inspired design system for modern web applications
            </FlutterText>
          </div>
        </div>
      </footer>
    </div>
  );
}

export default App;