import React from 'react';

interface FlutterTextProps {
  children: React.ReactNode;
  variant?: 'display' | 'headline' | 'title' | 'body' | 'label' | 'caption';
  weight?: 'normal' | 'medium' | 'semibold' | 'bold';
  color?: 'primary' | 'secondary' | 'accent' | 'default';
  className?: string;
}

export const FlutterText: React.FC<FlutterTextProps> = ({
  children,
  variant = 'body',
  weight = 'normal',
  color = 'default',
  className = ''
}) => {
  const getVariantClasses = () => {
    switch (variant) {
      case 'display':
        return 'text-4xl md:text-5xl leading-tight';
      case 'headline':
        return 'text-2xl md:text-3xl leading-tight';
      case 'title':
        return 'text-xl md:text-2xl leading-snug';
      case 'body':
        return 'text-base leading-relaxed';
      case 'label':
        return 'text-sm leading-normal';
      case 'caption':
        return 'text-xs leading-normal';
      default:
        return 'text-base leading-relaxed';
    }
  };

  const getWeightClasses = () => {
    switch (weight) {
      case 'medium':
        return 'font-medium';
      case 'semibold':
        return 'font-semibold';
      case 'bold':
        return 'font-bold';
      default:
        return 'font-normal';
    }
  };

  const getColorClasses = () => {
    switch (color) {
      case 'primary':
        return 'text-orange-500';
      case 'secondary':
        return 'text-gray-600';
      case 'accent':
        return 'text-red-500';
      default:
        return 'text-gray-900';
    }
  };

  return (
    <span className={`${getVariantClasses()} ${getWeightClasses()} ${getColorClasses()} ${className}`}>
      {children}
    </span>
  );
};