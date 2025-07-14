import React from 'react';

interface FlutterCardProps {
  children: React.ReactNode;
  title?: string;
  subtitle?: string;
  elevation?: 'none' | 'low' | 'medium' | 'high';
  padding?: 'none' | 'small' | 'medium' | 'large';
  className?: string;
}

export const FlutterCard: React.FC<FlutterCardProps> = ({
  children,
  title,
  subtitle,
  elevation = 'low',
  padding = 'medium',
  className = ''
}) => {
  const getElevationClasses = () => {
    switch (elevation) {
      case 'none':
        return 'shadow-none border border-gray-200';
      case 'low':
        return 'shadow-sm border border-gray-100';
      case 'medium':
        return 'shadow-md border border-gray-100';
      case 'high':
        return 'shadow-lg border border-gray-100';
      default:
        return 'shadow-sm border border-gray-100';
    }
  };

  const getPaddingClasses = () => {
    switch (padding) {
      case 'none':
        return '';
      case 'small':
        return 'p-4';
      case 'large':
        return 'p-8';
      default:
        return 'p-6';
    }
  };

  return (
    <div className={`
      bg-white rounded-lg transition-all duration-200 hover:shadow-md
      ${getElevationClasses()}
      ${getPaddingClasses()}
      ${className}
    `}>
      {(title || subtitle) && (
        <div className="mb-4">
          {title && (
            <h3 className="text-lg font-semibold text-gray-900 mb-1">
              {title}
            </h3>
          )}
          {subtitle && (
            <p className="text-sm text-gray-600">
              {subtitle}
            </p>
          )}
        </div>
      )}
      
      {children}
    </div>
  );
};