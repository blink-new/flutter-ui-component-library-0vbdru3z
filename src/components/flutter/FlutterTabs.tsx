import React, { useState } from 'react';

interface TabItem {
  id: string;
  label: string;
  content: React.ReactNode;
  icon?: React.ReactNode;
}

interface FlutterTabsProps {
  tabs: TabItem[];
  defaultTab?: string;
  onChange?: (tabId: string) => void;
  className?: string;
}

export const FlutterTabs: React.FC<FlutterTabsProps> = ({
  tabs,
  defaultTab,
  onChange,
  className = ''
}) => {
  const [activeTab, setActiveTab] = useState(defaultTab || tabs[0]?.id);

  const handleTabChange = (tabId: string) => {
    setActiveTab(tabId);
    onChange?.(tabId);
  };

  const activeTabContent = tabs.find(tab => tab.id === activeTab)?.content;

  return (
    <div className={`w-full ${className}`}>
      {/* Tab Headers */}
      <div className="flex border-b border-gray-200 bg-white rounded-t-lg overflow-hidden">
        {tabs.map((tab, index) => (
          <button
            key={tab.id}
            onClick={() => handleTabChange(tab.id)}
            className={`
              flex-1 px-6 py-4 text-sm font-medium transition-all duration-200
              flex items-center justify-center gap-2
              ${activeTab === tab.id
                ? 'text-orange-500 border-b-2 border-orange-500 bg-orange-50'
                : 'text-gray-600 hover:text-gray-900 hover:bg-gray-50'
              }
              ${index === 0 ? 'rounded-tl-lg' : ''}
              ${index === tabs.length - 1 ? 'rounded-tr-lg' : ''}
            `}
          >
            {tab.icon && <span className="w-4 h-4">{tab.icon}</span>}
            {tab.label}
          </button>
        ))}
      </div>

      {/* Tab Content */}
      <div className="bg-white rounded-b-lg border border-t-0 border-gray-200 p-6 min-h-[200px]">
        <div className="animate-fade-in">
          {activeTabContent}
        </div>
      </div>
    </div>
  );
};