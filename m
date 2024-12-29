Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0519FDD3E
	for <lists+drbd-dev@lfdr.de>; Sun, 29 Dec 2024 05:36:46 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B6D4516B80C;
	Sun, 29 Dec 2024 05:36:43 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 09AE2160963
	for <drbd-dev@lists.linbit.com>; Sun, 29 Dec 2024 05:36:38 +0100 (CET)
Received: by mail-pl1-f174.google.com with SMTP id
	d9443c01a7336-21644aca3a0so2476615ad.3
	for <drbd-dev@lists.linbit.com>; Sat, 28 Dec 2024 20:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chromium.org; s=google; t=1735446998; x=1736051798;
	darn=lists.linbit.com; 
	h=in-reply-to:content-disposition:mime-version:references:message-id
	:subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
	bh=fhoHuIrviDm79Rzafn1HMCTRe/3wZ+RwEGuu44Leo7Q=;
	b=gW/fFFDDXiXFBCSsdhHf3YvTaRsGKCKr2O4JbjCQ2Gn0ZxP7MWdt2z7W7VQjOcy41W
	66eGNQsW0HRyMEURVseSQDgAD53/EidtDn/7aBfV6GSBGsPM4Al+pUNkH8F9ZUYsnzka
	P7JWgzDNDiHxe7Rwl3QLFgv+7clV4WCkeo63g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1735446998; x=1736051798;
	h=in-reply-to:content-disposition:mime-version:references:message-id
	:subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=fhoHuIrviDm79Rzafn1HMCTRe/3wZ+RwEGuu44Leo7Q=;
	b=KSIOsTg3ot/LJuAwB+1Fvr2x+PKVhEx8JQFET/c1rm33gUX2JUBOEMa34PSf31CwIZ
	W6rkKy1UpxoVCfSWx0p5mcRnuIhg5nfZTRHr+PcJ/R6ki3o+8LL9FtvMBlI6zv3Tufq0
	srl1oJ27CSX9/F28RF336ZDc98XgBLuVG1BG6gwHeqsexvnOTZYs8tHQuN6x9Z/b+waB
	00T+X5jCVrxJDfasEiIX+tezjkDxXMVoaUJTx54ySc/kztJzrq/nKlVcpSdV0777yNVl
	kk4ZFsAFH2owAUZ1Nm5gEHdFEuXTPjcRViEs3CobVPeA5TPXYtuhYQlWc/qeA8pvHrV/
	Vkug==
X-Forwarded-Encrypted: i=1;
	AJvYcCWIYjYuyb1NSxdZItywiGXZlzUy0GGCLAqAqiImrSbmnUKGzS4GQ8b+fnyngbQYQw8z4wFE2ICu6Q==@lists.linbit.com
X-Gm-Message-State: AOJu0YziTSpAVuxgInKu3WPm0FGLJME5EWCqs55U2X+I8RMPMAsTBD9/
	rxLDnOB2zOzTlcT0FNcAf/2OpEHRggll7oIeuLN5jh6ba6dFfbT86cv5JhDyHg==
X-Gm-Gg: ASbGncudNmzzgJu7v/sC/i4wrdX6uQ8Xd9EJUgNXSKPwP0vTicrdtat5TwEo9nwfgBg
	S3xiuolgkEdQuEYgjd0sEnK9uaqFaipDhijgiF92S1eofLH76z58GKBY/L8ynqBGf9sxAAmMAfs
	4sVVdh+IFmJm5MqDCYH0RFpUzeb0tIoUgEPoasrJpxxai6lJexUUGISaujOP3MWt/HvQf9UAPeD
	b4zXVKVE+6oOrX4mxoy6mnI454rY0q4cKzlrMPAZ1IuTKqEgBtH6y7ldKpy
X-Google-Smtp-Source: AGHT+IHpB4lxQ3b1Hl94BfQscEhfLXiF9jx+bFESscdD3vO0Ynb7abuDXS6s97RIhF1oNJF0e1F9lg==
X-Received: by 2002:a17:903:944:b0:215:6e01:ad19 with SMTP id
	d9443c01a7336-219e6ebc9f5mr525797245ad.29.1735446997900; 
	Sat, 28 Dec 2024 20:36:37 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:76a8:6d89:3321:5163])
	by smtp.gmail.com with ESMTPSA id
	d9443c01a7336-219dc964b1fsm156534505ad.37.2024.12.28.20.36.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 28 Dec 2024 20:36:37 -0800 (PST)
Date: Sun, 29 Dec 2024 13:36:32 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Shi Xinhe <shixinhe6@gmail.com>
Subject: Re: [PATCH] Documentation zram: fix description about huge page
	writeback example
Message-ID: <qfagx4fjlluq4fox7fw5ltx63wxpifnr7lp3nkt63jm4wbtzp2@mna6znzgfqv2>
References: <20241229042758.163842-1-shixinhe6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241229042758.163842-1-shixinhe6@gmail.com>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, philipp.reisner@linbit.com,
	linux-kernel@vger.kernel.org, minchan@kernel.org,
	lars.ellenberg@linbit.com, senozhatsky@chromium.org,
	drbd-dev@lists.linbit.com
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

On (24/12/29 04:27), Shi Xinhe wrote:
> 
> Corrected the description to accurately reflect that huge page writeback example.

But what is the correction?  In zram huge page is incompressible page.
