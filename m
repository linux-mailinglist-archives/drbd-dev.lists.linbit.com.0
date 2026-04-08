Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLRlDMJD1mk0DAgAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Wed, 08 Apr 2026 14:02:10 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id AA9633BBA4B
	for <lists+drbd-dev@lfdr.de>; Wed, 08 Apr 2026 14:02:04 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 16D06163148;
	Wed,  8 Apr 2026 14:01:52 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6B54A160849
	for <drbd-dev@lists.linbit.com>; Wed,  8 Apr 2026 14:01:47 +0200 (CEST)
Received: by mail-wr1-f47.google.com with SMTP id
	ffacd0b85a97d-43cf5fbacc9so408592f8f.1
	for <drbd-dev@lists.linbit.com>; Wed, 08 Apr 2026 05:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20251104.gappssmtp.com; s=20251104; t=1775649707;
	x=1776254507; darn=lists.linbit.com; 
	h=in-reply-to:content-disposition:mime-version:references
	:mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
	:subject:date:message-id:reply-to;
	bh=zKYv/92g4USBYnuvjQ2o6KcGgYeWGPu2ptasrtf+UBI=;
	b=DkyJyPXwK3FUbt7O+PLgrqfIqk1zru19u0LoT5QgAfeF9bkaGhnHqhtmmjkCMJGReH
	QXsaXjRcrTFMommbC1y3BzMD/ToHk/Iu61+RY8IwJF1E4IdofX2XmQR2YHRW6oaddVew
	DAk6TfG3EjDtIbkbXm7QkatL1IgwHS/8D/QNTST4WniHauxB+vVHMYA/DmfN1ghReTvk
	yx8lLSL7X51D+sRe8aB0sDBSMtlEV1l69MxArY9VbwvxFaG79CQWK66yGXAu2nU/km5S
	5cSdSOFiIARXfWr9lZ1nSJeycQEyTEDVMl0nsdCDWoiDMjBbdaP7nlLNzlnMHqXHnU7J
	WpfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1775649707; x=1776254507;
	h=in-reply-to:content-disposition:mime-version:references
	:mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=zKYv/92g4USBYnuvjQ2o6KcGgYeWGPu2ptasrtf+UBI=;
	b=N75DPKAvBcIUJVDSB3bZ4AXSkrmP+bKPyfR3a6fLscN+hzMUZ1hHk/5fGVLLd00Isl
	NRrnQClcuHmgGrcwyVMycp/bWp4zED/idqkFroDHUSzTY2G9a9S/rPXwEsSQXwE/D3R7
	mlnPi95YG3D59yKPNnnkogcn87CF8G/MHgvlgPy9APLIocHNy3nriz2pbTU8huV5KbfQ
	plTXrmUarQiyEMbxux43YWKOwkzZ+ITwCYTbbC148fyBcZVp54PTMhMqH/K6g/eAA/wp
	qsiSNol9jws3/2OrfvGR2CZzq5NFl1aitjKYnGP2HiHWFUNUu/Zf+IsxxBzCPQSk9yMH
	+Ycw==
X-Forwarded-Encrypted: i=1;
	AJvYcCVy8KGfuwo949K8/sNbGqoQl1gZMw7YzX+0nz0kLASpuDgoDEGAp2H6F+/dY+zsgF0UNZCfq1JGBQ==@lists.linbit.com
X-Gm-Message-State: AOJu0Yzm65IbVJ2vPCM3A7PBNrAbSjmM1HRufncOPDHyeekenqYH3gtl
	XgamHxI8Ygj7P6arpXggpOOqxWJjtCpSIrpeqoBucEJFzM0HV9boj0J3JTeLdjUVbUNI5A==
X-Gm-Gg: AeBDiesQ12n14frIAO1Ommz7h8+sWFEwb7NOiNLyVGHjIgtS3DCD/igwNnpVW5IvFoB
	slCAuN2CJvFa8M1SPXjOjVMbM9H9bYMhNQ7/BsHIpjVgQGckDwszPTKtJISCRjvMeddW/+tnogo
	GdNwIFbKN2yZknb/id3NxnNJ3AKE50pWSVTsFBPm73lR64KON1qYrATutdtyZHvvhy27sj/iTqo
	CjS8VTiQ4nK3Asa0hDHZyT/4UBQpc8fgjNhjNYR5UCQa8NR3U0N6LbZJ8EYTs0O9Qy/liRktjLi
	AQdMACNbrIFczj1AXjafiBorsB9Q7XJOPtaSmLKQZctOz4OPKwA35W/WJK/Hq2rq5wbt3zgByH3
	KfXepyCEXxs2mlkf4RipN4LnDXlGwYb+Y9hNHSsN0rhrMZADA71LykeNw3y9CqyPIiETXGnSPzw
	Tf0wDlo7t4ORDqpuNxknKOFs1cASriq8q6wfkhduqxsP2ekHTfDGtSbHYe/Rgj4DqszUy9i7vZt
	rt4/A==
X-Received: by 2002:a5d:5d0a:0:b0:43c:fac5:d382 with SMTP id
	ffacd0b85a97d-43d2118dc50mr36398359f8f.12.1775649706776; 
	Wed, 08 Apr 2026 05:01:46 -0700 (PDT)
Received: from localhost (h082218028181.host.wavenet.at. [82.218.28.181])
	by smtp.gmail.com with ESMTPSA id
	ffacd0b85a97d-43d1e4f5294sm54605833f8f.35.2026.04.08.05.01.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Apr 2026 05:01:45 -0700 (PDT)
Date: Wed, 8 Apr 2026 14:01:43 +0200
From: Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 06/20] drbd: add RDMA transport implementation
Message-ID: <adZCPanS7iZlcPE9@localhost.localdomain>
Mail-Followup-To: Christoph Hellwig <hch@infradead.org>, 
	Jens Axboe <axboe@kernel.dk>, drbd-dev@lists.linbit.com,
	linux-kernel@vger.kernel.org, 
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>, 
	linux-block@vger.kernel.org, Joel Colledge <joel.colledge@linbit.com>, 
	linux-rdma@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>
References: <20260327223820.2244227-1-christoph.boehmwalder@linbit.com>
	<20260327223820.2244227-7-christoph.boehmwalder@linbit.com>
	<adXq36pbGLXMZc2r@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <adXq36pbGLXMZc2r@infradead.org>
Cc: Jens Axboe <axboe@kernel.dk>, Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>, Lars Ellenberg <lars.ellenberg@linbit.com>,
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
X-Spamd-Result: default: False [-0.91 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	NEURAL_SPAM(0.00)[0.923];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_REJECT(0.00)[linbit-com.20251104.gappssmtp.com:s=20251104];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	DMARC_POLICY_ALLOW(0.00)[linbit.com,none];
	ASN_FAIL(0.00)[96.154.69.159.asn.rspamd.com:query timed out];
	FORGED_RECIPIENTS(0.00)[m:hch@infradead.org,m:axboe@kernel.dk,m:leon@kernel.org,m:linux-rdma@vger.kernel.org,m:philipp.reisner@linbit.com,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:jgg@ziepe.ca,m:lars.ellenberg@linbit.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	DKIM_TRACE(0.00)[linbit-com.20251104.gappssmtp.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FROM_NEQ_ENVFROM(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost.localdomain:mid,mail19.linbit.com:helo,mail19.linbit.com:rdns]
X-Rspamd-Queue-Id: AA9633BBA4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 10:42:55PM -0700, Christoph Hellwig wrote:
>You really need to add the RDMA mailing list before adding new RDMA
>code.  I'll try to review the bits I still remember, but you also
>need a maintainer ACK.

Thanks for the hint and your detailed feedback. I'll address all that
in v2 (plus some other similar fixes).

Thanks,
Christoph
