Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 937498719AD
	for <lists+drbd-dev@lfdr.de>; Tue,  5 Mar 2024 10:34:57 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E3062420301;
	Tue,  5 Mar 2024 10:34:55 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
	[209.85.167.47])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id ADF3B4201A7
	for <drbd-dev@lists.linbit.com>; Tue,  5 Mar 2024 10:34:51 +0100 (CET)
Received: by mail-lf1-f47.google.com with SMTP id
	2adb3069b0e04-5133bd7eb47so3485397e87.3
	for <drbd-dev@lists.linbit.com>; Tue, 05 Mar 2024 01:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1709631290;
	x=1710236090; darn=lists.linbit.com; 
	h=user-agent:in-reply-to:content-disposition:mime-version:references
	:message-id:subject:to:from:date:from:to:cc:subject:date:message-id
	:reply-to; bh=72ZfboMSXXZjLXEVQYVOq/F+OTm3MhkWe2rYEb6JuHM=;
	b=uH4SI5F/kS30MvD4UI3oB5l+REHqoR3BYZek1Yx9ste6ogltIQEJhOWv/ujXiuQRIC
	FoCPfOwMqRKKtBgngU9daLxzhPRnv7/1PSiJjPprAUtt1ypgrbNdOMjlbIImB62PLG9o
	mURJqf+/5uTHYOnPfCjvg0Sh9RrAZ7Md3vzTv6FCS+JYSJ2eRdFPjXbe5RVRXiOPAKzt
	/Lz7KjdQ5vR98DNeK4g5hGb6cXZoe4jMQyl5jbOhJHNGojFqnelCBw0x4FDkOHUPaUJ1
	BJs1mQyImMuwyrcq+p/9OlGM2AmTBz5hcDyl4KQTssZB9lN8G2VaRezRjvqvdHLP0bJ4
	ZymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1709631290; x=1710236090;
	h=user-agent:in-reply-to:content-disposition:mime-version:references
	:message-id:subject:to:from:date:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=72ZfboMSXXZjLXEVQYVOq/F+OTm3MhkWe2rYEb6JuHM=;
	b=du/dmOFhOUQnQ3qG3dhJK0PRzr+7+Ud716oPCvpQHiRSQgDQ9CNFF3vRfWMSIIaaMN
	+rVPWuyp/oqlsxYoKlh+iCptjS4fyy8ySVpct8RPlkTyLxhSWtoTspktIot0NKTPa01A
	Du6270MqTikr+Em98xfOMQYXnI8r85t0Ys4WEkiErRHGFUW1ypvhxIBiWxIeNVrHcBp2
	etGHzr3UHe2xqJZ6t779nxeKmKrA7d5T95mV7jPuF5z2Svuacaht3KMhGd/gn96HjUeL
	WjV6cHNaweKr0Y9OePgUSa0nAWJb4dF+xau+uywxf+gxsM0uzqF/gjx2WOLkHKVawaYD
	rl5Q==
X-Gm-Message-State: AOJu0Yw1teVwbKBu1qMadjcj/pV18Z4ELOzUKnnjbTAnFL4ssa3kdFqE
	7Tpg81Lx5q0c4Z6ZmQW1ZAoyr23eOfFFsKPwtYa05/ZOpnDKSb+9D0wECQziDZETC2jWqHgzhtl
	T6zl29Q==
X-Google-Smtp-Source: AGHT+IGh5Ah8H6wKf9XKdJilGADU/53gHcmC+gLy9j8JM6wCFGd5WrXGBBm49gtsm2fsKYDIkgDsHw==
X-Received: by 2002:ac2:44c4:0:b0:513:1cb1:fd9b with SMTP id
	d4-20020ac244c4000000b005131cb1fd9bmr788701lfm.18.1709631289916;
	Tue, 05 Mar 2024 01:34:49 -0800 (PST)
Received: from localhost (static.20.139.203.116.clients.your-server.de.
	[116.203.139.20]) by smtp.gmail.com with ESMTPSA id
	o14-20020a05600c510e00b00412aff7874esm17439858wms.48.2024.03.05.01.34.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 05 Mar 2024 01:34:49 -0800 (PST)
Date: Tue, 5 Mar 2024 10:34:48 +0100
From: Roland Kammerer <roland.kammerer@linbit.com>
To: drbd-dev@lists.linbit.com
Subject: Re: [PATCH] configure.ac: Add an option to disable host udev version
	checks
Message-ID: <ZebnOCAsOgmAKuX9@rck.sh>
References: <20240302154129.683863-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240302154129.683863-1-yoann.congal@smile.fr>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <https://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <https://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

thanks, applied

https://github.com/LINBIT/drbd-utils/commit/f2b5a7335ae52109dfb95a9d99ae20519c43d59a
