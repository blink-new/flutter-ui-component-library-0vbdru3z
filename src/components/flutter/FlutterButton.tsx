import React from 'react';

interface FlutterButtonProps {
  children: React.ReactNode;
  variant?: 'elevated' | 'filled' | 'outlined' | 'text';
  size?: 'small' | 'medium' | 'large';
  disabled?: boolean;
  onClick?: () => void;
  className?: string;
}

export const FlutterButton: React.FC<FlutterButtonProps> = ({
  children,
  variant = 'filled',
  size = 'medium',
  disabled = false,
  onClick,
  className = ''
}) => {
  const getVariantClasses = () => {
    switch (variant) {
      case 'elevated':
        return 'bg-white text-gray-900 shadow-md hover:shadow-lg border border-gray-200 hover:bg-gray-50';
      case 'filled':
        return 'flutter-gradient text-white hover:opacity-90 shadow-sm';
      case 'outlined':
        return 'bg-transparent text-orange-500 border-2 border-orange-500 hover:bg-orange-50';
      case 'text':
        return 'bg-transparent text-orange-500 hover:bg-orange-50';
      default:
        return 'flutter-gradient text-white hover:opacity-90 shadow-sm';
    }
  };

  const getSizeClasses = () => {
    switch (size) {
      case 'small':
        return 'px-3 py-1.5 text-sm';
      case 'large':
        return 'px-8 py-4 text-lg';
      default:
        return 'px-6 py-3 text-base';
    }
  };

  const disabledClasses = disabled 
    ? 'opacity-50 cursor-not-allowed pointer-events-none' 
    : 'cursor-pointer';

  return (
    <button
      onClick={onClick}
      disabled={disabled}
      className={`
        ${getVariantClasses()}
        ${getSizeClasses()}
        ${disabledClasses}
        rounded-lg font-medium transition-all duration-200 
        focus:outline-none focus:ring-2 focus:ring-orange-400 focus:ring-offset-2
        active:scale-95 transform
        ${className}
      `}
    >
      {children}
    </button>
  );
};